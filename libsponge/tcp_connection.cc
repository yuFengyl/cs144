#include "tcp_connection.hh"

#include <iostream>

// Dummy implementation of a TCP connection

// For Lab 4, please replace with a real implementation that passes the
// automated checks run by `make check`.

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

size_t TCPConnection::remaining_outbound_capacity() const { return _sender.stream_in().remaining_capacity(); }

size_t TCPConnection::bytes_in_flight() const { return _sender.bytes_in_flight(); }

size_t TCPConnection::unassembled_bytes() const { return _receiver.unassembled_bytes(); }

size_t TCPConnection::time_since_last_segment_received() const { return _time_since_last_segment_received; }

void TCPConnection::segment_received(const TCPSegment &seg) { DUMMY_CODE(seg); }

bool TCPConnection::active() const { return _active; }

//! \brief Write data to the outbound byte stream, and send it over TCP if possible
//! \returns the number of bytes from `data` that were actually written.
size_t TCPConnection::write(const string &data) {
    size_t byte = _sender.stream_in().write(data);
    _sender.fill_window();
    add_ackno_and_window_size();
    return byte;
}

//! \param[in] ms_since_last_tick number of milliseconds since the last call to this method
void TCPConnection::tick(const size_t ms_since_last_tick) { DUMMY_CODE(ms_since_last_tick); }

//! \brief Shut down the outbound byte stream (still allows reading incoming data)
void TCPConnection::end_input_stream() {
    _sender.stream_in().end_input();
    // 这里非常重要，我们需要在结束 outbound ByteStream 后再发送 FIN
    _sender.fill_window();
    add_ackno_and_window_size();
}

//! \brief Initiate a connection by sending a SYN segment
void TCPConnection::connect() {
    _active = true;
    // 直接调用 fill_window() 函数就可以了，它会在连接还没有建立的时候会发送 syn
    _sender.fill_window();
    add_ackno_and_window_size();
}

void TCPConnection::add_ackno_and_window_size() {
    while (!_sender.segments_out().empty()) {
        TCPSegment seg = _sender.segments_out().front();
        _sender.segments_out().pop();
        if (_receiver.ackno().has_value()){
            seg.header().ack = true;
            seg.header().ackno = _receiver.ackno().value();
        }
        seg.header().win = _receiver.window_size();
        _segments_out.push(seg);
    }
}

TCPConnection::~TCPConnection() {
    try {
        if (active()) {
            cerr << "Warning: Unclean shutdown of TCPConnection\n";

            // Your code here: need to send a RST segment to the peer
        }
    } catch (const exception &e) {
        std::cerr << "Exception destructing TCP FSM: " << e.what() << std::endl;
    }
}
