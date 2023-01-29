#include "stream_reassembler.hh"
#include <iostream>

// Dummy implementation of a stream reassembler.

// For Lab 1, please replace with a real implementation that passes the
// automated checks run by `make check_lab1`.

// You will need to add private members to the class declaration in `stream_reassembler.hh`

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

StreamReassembler::StreamReassembler(const size_t capacity) :
    _output(capacity), _capacity(capacity), _unassembled_string(), _first_unassembled_index(0),
    _unassembled_length(0), _eof_flag(false), _eof_index(0){}

void StreamReassembler::put_into_map(string data, size_t index) {
    for (unsigned long i=0; i<data.length(); i++){
        _unassembled_string.insert({index+i, data[i]});
    }
    _unassembled_length = _unassembled_string.size();
}

void StreamReassembler::assemble_string_in_map() {
    string s = string();
    size_t last_index = _first_unassembled_index-1;
    for (auto iter = _unassembled_string.begin(); iter != _unassembled_string.end(); ){
        if(iter->first < _first_unassembled_index){
            iter = _unassembled_string.erase(iter);
        }
        else{
            if (last_index + 1 == iter->first){
                s.push_back(iter->second);
                last_index = iter->first;
                iter = _unassembled_string.erase(iter);
            }
            else
                break;
        }
    }
    size_t written_bytes = _output.write(s);
    _first_unassembled_index += written_bytes;
    _unassembled_length = _unassembled_string.size();
}

    //! \details This function accepts a substring (aka a segment) of bytes,
//! possibly out-of-order, from the logical stream, and assembles any newly
//! contiguous substrings and writes them into the output stream in order.
void StreamReassembler::push_substring(const string &data, const size_t index, const bool eof) {
    if (eof){
        _eof_flag = eof;
        _eof_index = data.length() + index;
    }
    assemble_string_in_map();
    size_t unassembled_length = _output.remaining_capacity();
    if (index == _first_unassembled_index){
        if (data.length() <= unassembled_length){ // we can write all data into ByteStream
            _output.write(data);
            _first_unassembled_index += data.length();
            assemble_string_in_map();
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
    else{
        if (index >= _first_unassembled_index + unassembled_length)
            return ;
        else {
            string data_cut = data;
            if (data.length() + index > _first_unassembled_index + unassembled_length)
                data_cut = data_cut.substr(0, _first_unassembled_index - unassembled_length - index);
            put_into_map(data_cut, index);
        }
    }
    if (_eof_flag == true && _eof_index <= _first_unassembled_index) {
        cout << "EOF EXECUTED" << "data: " << data << endl;
        _output.end_input();
    }
}

size_t StreamReassembler::unassembled_bytes() const { return _unassembled_length; }

bool StreamReassembler::empty() const { return _unassembled_length == 0; }
