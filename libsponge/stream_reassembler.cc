#include "stream_reassembler.hh"

// Dummy implementation of a stream reassembler.

// For Lab 1, please replace with a real implementation that passes the
// automated checks run by `make check_lab1`.

// You will need to add private members to the class declaration in `stream_reassembler.hh`

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

StreamReassembler::StreamReassembler(const size_t capacity) :
    _output(capacity), _capacity(capacity), _unassembled_string(), _first_unassembled_index(0), _eof_index(0) ,_eof_flag(false){}

void StreamReassembler::assemble_string() {
    auto it = _unassembled_string.begin();
    for(; it!=_unassembled_string.end(); it++){
        if(it->first <= _first_unassembled_index){
            if (it->first + it->second.length() <= _first_unassembled_index)
                continue ;
            size_t written_length = it->first + it->second.length() - _first_unassembled_index;
            string data_written = it->second.substr(_first_unassembled_index-it->first, written_length);
            _first_unassembled_index += _output.write(data_written);
        }
        else break;
    }
    /*删除已经处理过的字符流*/
    _unassembled_string.erase(_unassembled_string.begin(), it);
    /*如果已经处理好最后一个流了就设置eof*/
    if(_eof_flag && _eof_index <= _first_unassembled_index){
        _output.end_input();
    }
}

//! \details This function accepts a substring (aka a segment) of bytes,
//! possibly out-of-order, from the logical stream, and assembles any newly
//! contiguous substrings and writes them into the output stream in order.
void StreamReassembler::push_substring(const string &data, const size_t index, const bool eof) {
    if (eof){
        _eof_flag = true;
        _eof_index = data.length() + index;
    }
    // TODO 这里需要检查 map 中有没有新的可以装配的, 装配的原因是因为 index 进行了更新
    assemble_string();
    size_t unassembled_length = _first_unassembled_index + (_capacity - _output.remaining_capacity());
    if (index == _first_unassembled_index){ // which means we should write it into ByteStream
        if (data.length() <= unassembled_length){ // we can write all data into ByteStream
            _output.write(data);
            _first_unassembled_index += data.length();
            // TODO 这里需要检查 map 中有没有新的可以装配的
            assemble_string();
        }
        else {  // we can not write all data into ByteStream, it needs to be cut
            string temp = data.substr(0, unassembled_length);
            _output.write(temp);
            _first_unassembled_index += temp.length();
        }
    }
    else if (index < _first_unassembled_index) {
        if (index + data.length() <= _first_unassembled_index)
            return ;
        push_substring(data.substr(_first_unassembled_index - index), _first_unassembled_index, eof);
    }
    else{ // 否则说明我们可能需要将其存入 map 中，也有可能需要将其丢弃
        if (index >= _first_unassembled_index + unassembled_length)
            return ;
        else {
            string data_cut = data;
            if (data.length() + index > _first_unassembled_index + unassembled_length)
                data_cut = data_cut.substr(0, _first_unassembled_index - unassembled_length - index);
            _unassembled_string.insert(make_pair(index, data_cut));
        }
    }
    size_t last_index = _first_unassembled_index;
    size_t count = 0;
    auto it = _unassembled_string.begin();
    for(; it!=_unassembled_string.end(); it++) {
        if (it->first < last_index){
            if (it->first + it->second)
        }
    }
}

size_t StreamReassembler::unassembled_bytes() const {
}

bool StreamReassembler::empty() const { return {}; }
