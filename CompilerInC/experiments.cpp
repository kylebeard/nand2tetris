#include <array>
#include <fstream>
#include <iostream>
#include <unordered_map>
#include <vector>
using namespace std;
void test_fstream();
void test_string();
void test_szof_arr(vector<string>);
string join(vector<string>, string);
void test_bool();
void test_map();

int main() {
    test_map();
    return 0;
}

void test_map() {
    unordered_map<string, string> m;
    m["1"] = "one";
    string s = m["1"];
    cout << "m[\"1\"]: " << s << endl;
    string s1 = m["2"];
    cout << "m[\"2\"]: " << s1 << endl;
    cout << "s1 == null: " << (s1 == "") << endl;
}

void test_bool() {
    int i = 1 == 1;
    int j = 1 == 2;
    bool b = 1 == 1;
    bool c = 1 == 2;
    cout << "i: " << i << "j " << j << "b " << b << " c" << c;
}

string join(vector<string> vals, string sep) {
    size_t seplen = sep.size();
    string joined = vals.at(0);
    for (int i = 1; i < vals.size(); i++) {
        joined += sep;
        joined += vals[i];
        // size_t joinedlen = strlen(joined);
        // size_t currValLen = strlen(vals[i]);
        // joined = (char *)realloc(joined, joinedlen + seplen + currValLen + 1);
        // strlcat(joined, sep, joinedlen + seplen + 1);
        // strlcat(joined, vals[i], joinedlen + seplen + currValLen + 1);
    }

    return joined;
}


void test_szof_arr(vector<string> vals) {
    size_t sz = vals.size();
    cout << "sz: " << sz << endl;
}

void test_string() {
    string s = "hi";
    cout << s.size() << endl;
    cout << s.length() << endl;
    cout << s.capacity();
}
void test_fstream() {
    string filename = "testofstream.txt";

    ofstream fs(filename, ios::trunc);
    // fs.write("hello\n", 7);
    fs << "hello\n";
    fs.close();
}