#define CATCH_CONFIG_MAIN
#include "Symbol.hpp"
#include "SymbolTable.hpp"
#include "catch.hpp"
#include <cassert>
#include <iostream>
#include <string>
using namespace std;

TEST_CASE("Symbol tests", "[Symbol]") {
    string n = "name";
    string t = "int";
    SymbolKind sk = FIELD_SK;
    int i = 0;

    Symbol s(n, t, sk, i);
    CHECK(s.name == "name");
    CHECK(s.type == "int");
    CHECK(s.kind == FIELD_SK);
    CHECK(s.index == 0);
}

TEST_CASE("SymbolTable tests", "[SymbolTable]") {
    SymbolTable st;
    st.define("fld1", "int", FIELD_SK);
    st.define("fld2", "int", FIELD_SK);
    st.define("stc1", "int", STATIC_SK);
    st.define("stc2", "int", STATIC_SK);
    st.define("var1", "int", VAR_SK);
    st.define("var2", "int", VAR_SK);
    st.define("arg1", "int", ARG_SK);
    st.define("arg2", "int", ARG_SK);
    // st.define("sub1", "int", SUBROUTINE_SK);
    // st.define("sub2", "int", SUBROUTINE_SK);
    auto sym = st.get("fld1");
    CHECK(sym.type == "int");
    CHECK(sym.kind == FIELD_SK);
    CHECK(sym.index == 0);
    sym = st.get("fld2");
    CHECK(sym.type == "int");
    CHECK(sym.kind == FIELD_SK);
    CHECK(sym.index == 1);
    sym = st.get("var1");
    CHECK(sym.type == "int");
    CHECK(sym.kind == VAR_SK);
    CHECK(sym.index == 0);
    sym = st.get("var2");
    CHECK(sym.type == "int");
    CHECK(sym.kind == VAR_SK);
    CHECK(sym.index == 1);


    CHECK(st.exists("arg1"));
    CHECK(st.exists("arg2"));
    CHECK(!st.exists("arg3"));


    CHECK(st.varCount(STATIC_SK) == 2);


    CHECK(st.kindOf("var1") == VAR_SK);
    CHECK(st.typeOf("stc1") == "int");
    CHECK(st.indexOf("arg2") == 1);

    st.startSubroutine();
    CHECK(st.varCount(VAR_SK) == 0);
    CHECK(st.varCount(ARG_SK) == 0);
    CHECK(st.varCount(FIELD_SK) == 2);
    CHECK(st.varCount(STATIC_SK) == 2);
}
