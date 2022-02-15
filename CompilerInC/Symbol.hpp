#ifndef JACK_COMPILER_IN_C_SYMBOL_H
#define JACK_COMPILER_IN_C_SYMBOL_H

#include <string>

using namespace std;
enum SymbolKind { FIELD_SK, STATIC_SK, VAR_SK, ARG_SK, CLASS_SK, SUBROUTINE_SK };


class Symbol {
  public:
    string name, type;
    SymbolKind kind;
    int index;

    Symbol(Symbol &s) : name(s.name), type(s.type), kind(s.kind), index(s.index) {
    }
    Symbol(Symbol &&s) : name(s.name), type(s.type), kind(s.kind), index(s.index) {
    }
    Symbol(string _name, string _type, SymbolKind _kind, int _index)
        : name(_name), type(_type), kind(_kind), index(_index) {
    }
    Symbol &operator=(const Symbol &other) {
        name = other.name;
        type = other.type;
        kind = other.kind;
        index = other.index;
        return *this;
    }
};

#endif // !SYMBOL_H