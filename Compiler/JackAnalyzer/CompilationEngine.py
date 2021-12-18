from typing import TextIO
from JackTokenizer import JackTokenizer


class CompliationEngine:
    def __init__(self, input: JackTokenizer, outfile: TextIO) -> None:
        pass

    def compile_class(self) -> None:
        pass

    def compile_class_var_dec(self) -> None:
        pass

    def compile_subroutine_dec(self) -> None:
        pass

    def compile_param_list(self) -> None:
        pass

    def compile_subroutine_body(self) -> None:
        pass

    def compile_var_dec(self) -> None:
        pass

    def compile_statements(self) -> None:
        pass

    def compile_let(self) -> None:
        pass

    def compile_if(self) -> None:
        pass

    def compile_while(self) -> None:
        pass

    def compile_do(self) -> None:
        pass

    def compile_return(self) -> None:
        pass

    def compile_expr(self) -> None:
        pass

    def compile_term(self) -> None:
        pass

    def compile_expr_list(self) -> None:
        pass
