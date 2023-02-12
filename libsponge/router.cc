#include "router.hh"

#include <iostream>

using namespace std;

// Dummy implementation of an IP router

// Given an incoming Internet datagram, the router decides
// (1) which interface to send it out on, and
// (2) what next hop address to send it to.

// For Lab 6, please replace with a real implementation that passes the
// automated checks run by `make check_lab6`.

// You will need to add private members to the class declaration in `router.hh`

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

//! \param[in] route_prefix The "up-to-32-bit" IPv4 address prefix to match the datagram's destination address against
//! \param[in] prefix_length For this route to be applicable, how many high-order (most-significant) bits of the route_prefix will need to match the corresponding bits of the datagram's destination address?
//! \param[in] next_hop The IP address of the next hop. Will be empty if the network is directly attached to the router (in which case, the next hop address should be the datagram's final destination).
//! \param[in] interface_num The index of the interface to send the datagram out on.
void Router::add_route(const uint32_t route_prefix,
                       const uint8_t prefix_length,
                       const optional<Address> next_hop,
                       const size_t interface_num) {
    cerr << "DEBUG: adding route " << Address::from_ipv4_numeric(route_prefix).ip() << "/" << int(prefix_length)
         << " => " << (next_hop.has_value() ? next_hop->ip() : "(direct)") << " on interface " << interface_num << "\n";

    _router_table.push_back(router_table_item{route_prefix, prefix_length, next_hop, interface_num});
}

//! \param[in] dgram The datagram to be routed
void Router::route_one_datagram(InternetDatagram &dgram) {
    uint8_t longest = 0;
    size_t interface_num = 0;
    std::optional<Address> next_hop;
    int flag = false;
    for (auto iter = _router_table.begin(); iter != _router_table.end(); iter++){
        if (iter->prefix_length >= longest){
            uint32_t mask = iter->prefix_length == 0 ? 0 : (0xffffffff << (32 - iter->prefix_length));
            if ((mask & dgram.header().dst) == (iter->route_prefix & mask)) {
                longest = iter->prefix_length;
                interface_num = iter->interface_num;
                flag = true;
                next_hop = iter->next_hop;
            }
        }
    }
    if (!flag)
        return ;
    if (dgram.header().ttl <= 1)
        return ;
    dgram.header().ttl--;
    if (next_hop.has_value()) {
        interface(interface_num).send_datagram(dgram, next_hop.value());
    }
    else {
        interface(interface_num).send_datagram(dgram, Address::from_ipv4_numeric(dgram.header().dst));
    }
}

void Router::route() {
    // Go through all the interfaces, and route every incoming datagram to its proper outgoing interface.
    for (auto &interface : _interfaces) {
        auto &queue = interface.datagrams_out();
        while (not queue.empty()) {
            route_one_datagram(queue.front());
            queue.pop();
        }
    }
}
