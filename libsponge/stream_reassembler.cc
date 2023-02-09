#include "stream_reassembler.hh"

// Dummy implementation of a stream reassembler.

// For Lab 1, please replace with a real implementation that passes the
// automated checks run by `make check_lab1`.

// You will need to add private members to the class declaration in `stream_reassembler.hh`

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

StreamReassembler::StreamReassembler(const size_t capacity) : _output(capacity), _capacity(capacity) {}

// size_t是标准C库中定义的，它是一个基本的与机器相关的无符号整数的C/C + +类型, 而这里要返回有符号数 -1 ，因此应该为 long
long StreamReassembler::merge_node(block &t1, const block &t2) {
    block front, back;
    if (t1.begin > t2.begin) {
        front = t2;
        back = t1;
    }
    else {
        front = t1;
        back = t2;
    }
    if (front.begin + front.data.length() < back.begin) {
        return -1;  // no intersection, couldn't merge
    }
    else if (front.begin + front.data.length() >= back.begin + back.data.length()) {
        t1 = front;
        return back.data.length();
    }
    else {
        t1.begin = front.begin;
        t1.data = front.data + back.data.substr(front.begin + front.data.length() - back.begin);
        return front.begin + front.data.length() - back.begin;
    }
}

//! \details This function accepts a substring (aka a segment) of bytes,
//! possibly out-of-order, from the logical stream, and assembles any newly
//! contiguous substrings and writes them into the output stream in order.
void StreamReassembler::push_substring(const string &data, const size_t index, const bool eof) {
    if (index >= _first_unassembled_index + _output.remaining_capacity())
        return ;
    if (eof) {
        _eof = true;
    }
    block node;
    if (index + data.length() <= _first_unassembled_index){
        // 即使这个数据已经被接受了，但对方也有可能断开连接，因此这里需要我们判断一下是否要 end_input()
        if (_eof && empty()) {
            _output.end_input();
        }
        return ;
    }
    else if (index < _first_unassembled_index){
        node.data.assign(data.begin() + _first_unassembled_index - index, data.end());
        node.begin = _first_unassembled_index;
    }
    else{
        node.begin = index;
        node.data = data;
    }
    // 到此，上面已经将数据存到了 node 中
    _unassembled_byte += node.data.length();
    long merge_bytes;
    // 需要特别注意的是 low_bound(key) 会返回第一个大于等于 key 的迭代器，
    // 因此，下面的这个 while 实际上是在合并比当前 node 的 index 大的 node
    auto iter = _blocks.lower_bound(node);
    // 下面这里第二个判断条件应该是 大于等于0 ，因为两个 node 也可能相邻但并不相交
    while (iter != _blocks.end() && (merge_bytes = merge_node(node, *iter)) >= 0) {
        _unassembled_byte -= merge_bytes;
        _blocks.erase(iter);
        iter = _blocks.lower_bound(node);
    }
    iter = _blocks.lower_bound(node);
    if (iter != _blocks.begin()){ // 确保下面的操作不会发生错误，
                                  // 并且由于已经有了上面的合并，我们可以保证 node 不会和 _blocks.lower_bound(node); 需要合并
        iter--;
        // 这里不能有 iter != _blocks.begin() 这个判断条件，因为也有可能出现需要和 set 中第一个元素合并的情况
        while ((merge_bytes = merge_node(node, *iter)) >= 0){
            _unassembled_byte -= merge_bytes;
            _blocks.erase(iter);
            iter = _blocks.lower_bound(node);
            if (iter == _blocks.begin())
                break;
            iter--;
        }
    }
    _blocks.insert(node);
    if (!_blocks.empty() && _blocks.begin()->begin == _first_unassembled_index) {
        iter = _blocks.begin();
        size_t write_bytes = _output.write((iter->data));
        _first_unassembled_index += write_bytes;
        _unassembled_byte -= write_bytes;
        _blocks.erase(iter);
    }
    if (_eof && empty()) {
        _output.end_input();
    }
}

size_t StreamReassembler::unassembled_bytes() const { return _unassembled_byte; }

bool StreamReassembler::empty() const { return unassembled_bytes() == 0; }
