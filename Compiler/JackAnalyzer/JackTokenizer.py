"""
Tokenizer for Jack language -- part of the Nand2Tetris course
"""
from typing import List, TextIO, Tuple
from Keywords import Keywords
from TokenType import TokenType
import re
symbols = [
    '{', '}', '(', ')', '[', ']', '.', ',', ';',
    '+', '-', '*', '/', '&', '|', '<', '>', '=', '~'
]


class JackTokenizer:

    def __init__(self, infile: TextIO):  # , outfile: TextIO) -> None:
        """
        Everyting is done Line-by-Line.
        `tokens` is the unprocessed tokens left on this line
        """
        self.infile = infile
        # self.outfile = outfile
        self.current_line: str = ''

        self.current_token: str = ''
        self.current_token_type: TokenType = TokenType.NONE

        self.tokens: List[str] = []  # remaining tokens in the current line
        self.token_types: List[TokenType] = []  # TokenTypes's of the remaining tokens

    def has_more_tokens(self) -> bool:
        """Does the jack file have more tokens to process"""
        if len(self.tokens):
            return True

        pos = self.infile.tell()
        line = self.infile.readline()
        line = line.strip(' \t')  # still want to recognize new lines

        # ignore comments and newlines
        while (line.startswith(('//', '/*')) or line == "\n"):
            # doing everything line-by-line makes multi-line
            # comments hard to deal with
            if line.startswith('/*'):
                end_multi_line = line.find('*/')
                while end_multi_line == -1:
                    pos = self.infile.tell()
                    line = self.infile.readline().strip(" \t")
                    end_multi_line = line.find('*/')

                if len(line.strip()) > end_multi_line + 2:
                    raise Exception(
                        f'Code on the same line as the end of a multi-line comment is not supported.\n Cause: {line}')

            pos = self.infile.tell()
            line = self.infile.readline().strip(" \t")

        # return so next readline() will read the next tokens
        self.infile.seek(pos)

        return line != ''

    def advance(self) -> None:
        """
        Read in the next token.
        Should only be called if has_more_tokens returns True
        """
        if not len(self.tokens):
            self.current_line = self.infile.readline().strip()
            self._parse_tokens()

        self.current_token = self.tokens.pop(0)
        self.current_token_type = self.token_types.pop(0)
        # tt = self.current_token_type.value
        self.current_token = self.current_token\
            .replace('&', '&amp;')\
            .replace('<', '&lt;')\
            .replace('>', '&gt;')\
            .replace('"', '&quot;')

        # self.outfile.write(f'<{tt}> {t} </{tt}>\n')

    def _parse_tokens(self):
        """parses the tokens in the current_line"""
        # start tokenizing by splitting the current line on whitespace
        line = self.current_line

        tokens = []
        token_types = []

        keyword_regex = r''.join(f'{kw}|' for kw in Keywords.allKeywords)
        keyword_regex = keyword_regex[:-1]  # remove last | symbol
        keyword_regex = rf'\b({keyword_regex})\b'

        # progressively search for tokens and remove them from `line` until it is empty
        while len(line):
            # start of `line` may contain whitespace
            # after the last token was removed
            line = line.lstrip()
            # in-line single-line comments
            if line[:2] == '//':
                break

            # in-line multi-line comments
            if line[:2] == '/*':
                line = line[2:]
                end = line.find('*/')
                if end == -1:
                    raise Exception(f'Multi-line in-line comments are not supported. Cause: /*{line}')

                line = line[end+2:]
                continue

            # Keyword
            match = re.match(keyword_regex, line)
            if match:
                tokens.append(match.group())
                token_types.append(TokenType.KEYWORD)
                line = line[match.end():]
                continue

            # Symbol
            if line[0] in symbols:
                tokens.append(line[0])
                token_types.append(TokenType.SYMBOL)
                line = line[1:]
                continue

            # Integer Constant
            match = re.match(r"^\d+", line)
            if match:
                tokens.append(match.group())
                token_types.append(TokenType.INT_CONST)
                line = line[match.end():]
                continue

            # String constant
            match = re.match(r'"([^\n"]*)"', line)
            if match:
                tokens.append(match.group(1))
                token_types.append(TokenType.STR_CONST)
                line = line[match.end():]
                continue

            # Identifier
            match = re.match(r'[a-zA-Z_]\w*', line)
            if match:
                tokens.append(match.group())
                token_types.append(TokenType.IDENTIFIER)
                line = line[match.end():]
                continue

            raise Exception(f'Unrecognized Token {line}')

        self.tokens = tokens
        self.token_types = token_types

    def token_type(self) -> TokenType:
        """
        Returns the type of the current token
        Token types are actually determined in `_get_tokens` 
        when parsing the tokens in the current line
        """
        return self.current_token_type

    def token_value(self) -> str | int:
        """
        Returns the value of current token. 
        int if token_type is INT_CONST
        str otherwise
        """
        if self.current_token_type == TokenType.INT_CONST:
            return int(self.current_token)

        return self.current_token

    def not_used(self):
        print('')

        def symbol(self) -> str:
            """
            Returns the character which is the current token.
            Should only be called if token type is Symbol
            """
            return self.current_token

        def identifier(self) -> str:
            """
            Returns the identifier which is the current token.
            Should only be called if token type is Identifier
            """
            return self.current_token

        def int_val(self) -> int:
            """
            Returns the integer value which is the current token.
            Should only be called if token type is INT_CONST
            """
            return int(self.current_token)

        def str_val(self) -> str:
            """
            Returns the string value which is the current token.
            Should only be called if token type is STR_CONST
            """
            return self.current_token


if __name__ == '__main__':
    s = 'this  that  here > ther'
    t = s\
        .replace('&', '&amp;')\
        .replace('<', '&lt;')\
        .replace('>', '&gt;')\
        .replace('"', '&quot;')

    print(t)
