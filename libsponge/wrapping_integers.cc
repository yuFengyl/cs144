#include "wrapping_integers.hh"

// Dummy implementation of a 32-bit wrapping integer

// For Lab 2, please replace with a real implementation that passes the
// automated checks run by `make check_lab2`.

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

//! Transform an "absolute" 64-bit sequence number (zero-indexed) into a WrappingInt32
//! \param n The input absolute 64-bit sequence number
//! \param isn The initial sequence number
WrappingInt32 wrap(uint64_t n, WrappingInt32 isn) {
    return isn + n;
}

//! Transform a WrappingInt32 into an "absolute" 64-bit sequence number (zero-indexed)
//! \param n The relative sequence number
//! \param isn The initial sequence number
//! \param checkpoint A recent absolute 64-bit sequence number
//! \returns the 64-bit sequence number that wraps to `n` and is closest to `checkpoint`
//!
//! \note Each of the two streams of the TCP connection has its own ISN. One stream
//! runs from the local TCPSender to the remote TCPReceiver and has one ISN,
//! and the other stream runs from the remote TCPSender to the local TCPReceiver and
//! has a different ISN.
uint64_t unwrap(WrappingInt32 n, WrappingInt32 isn, uint64_t checkpoint) {
    WrappingInt32 checkpointTemp = wrap(checkpoint, isn);
    int32_t diff = n - checkpointTemp;
    // 相加规则: 先讲 diff 扩展成一个 64 位有符号数，然后再进行相加，最后将相加的结果替换成一个有符号数
    int64_t result = diff + checkpoint;
    // diff < 0 但 checkpoint + diff > checkpoint （这里同样会将 diff 扩展成一个 64 位的有符号数），说明 diff 的绝对值是要大于 checkpoint 的
    if (diff < 0 && checkpoint + diff > checkpoint)
        // 因此 n 和 checkpoint 可能并不属于同一个 WrappingInt32
        result = checkpoint + uint32_t(diff);
    return result;
}
