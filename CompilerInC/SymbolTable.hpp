#ifndef JACK_COMPILER_IN_C_SYMBOL_TABLE_H
#define JACK_COMPILER_IN_C_SYMBOL_TABLE_H
#include "Symbol.hpp"
#include <unordered_map>
using namespace std;

class SymbolTable {
  private:
    unordered_map<string, Symbol> globals;
    unordered_map<string, Symbol> locals;

  public:
    SymbolTable() {
    }
    Symbol get(string name) {
        if (locals.count(name) == 1)
            return locals.at(name);
        if (globals.count(name) == 1)
            return globals.at(name);

        throw notFound(name);
    }
    bool exists(string name) {
        try {
            auto sym = get(name);
            return true;
        } catch (const invalid_argument &e) { return false; }
    }
    int varCount(SymbolKind kind) {
        unordered_map<string, Symbol> &table = isLocal(kind) ? locals : globals;
        int count = 0;
        for (auto const &[key, val] : table) {
            if (val.kind == kind)
                count++;
        }
        return count;
    }
    void define(string name, string type, SymbolKind kind) {
        Symbol s(name, type, kind, varCount(kind));
        if (isLocal(kind)) {
            // locals[name] = s;
            locals.insert({name, s});
            return;
        }
        // globals[name] = s;
        globals.insert({name, s});
    }

    void startSubroutine() {
        locals.clear();
    }
    bool isLocal(SymbolKind kind) {
        return kind == VAR_SK || kind == ARG_SK;
    }
    SymbolKind kindOf(string name) {
        return get(name).kind;
    }
    string typeOf(string name) {
        return get(name).type;
    }
    int indexOf(string name) {
        return get(name).index;
    }
    invalid_argument notFound(string name) {
        return invalid_argument("Symbol '" + name + "' not found\n");
    }
};


#endif // !SYMBOL_TABLE_H
