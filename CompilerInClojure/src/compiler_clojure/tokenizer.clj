(ns compiler-clojure.tokenizer
  (:require [clojure.string :as str] [clojure.java.io :as io]))

(defrecord Token [value type])
(def ^:private base-dir "/Users/kyle/Documents/Programming/nand2tetris")
(def ^:private test-dir (str base-dir "/CompilerInClojure/test"))
(def ^:private arr-test (str test-dir "/ArrayTest/Main.jack"))
(def keywords {:class "class"
               :constructor "constructor"
               :function "function"
               :method "method"
               :field "field"
               :static "static"
               :var "var"
               :int "int"
               :char "char"
               :boolean "boolean"
               :void "void"
               :true "true"
               :false "false"
               :null "null"
               :this "this"
               :let "let"
               :do "do"
               :if "if"
               :else "else"
               :while "while"
               :return "return"})


(def symbols ["{" "}" "[" "]" "(" ")" "." "," ";" "+" "-" "*" "/" "&" "|" "<" ">" "=" "~"])

;; regular expressions for different token types (excluding symbols)
(def ^:private kw-re #"^(class|constructor|function|method|field|static|var|int|char|boolean|void|true|false|null|this|let|do|if|else|while|return)")
(def ^:private ident-re #"^([_a-zA-Z]\w*)")
(def ^:private int-re #"(\d{1,5})") ; max 32767
(def ^:private str-re #"^\"([^\"]*)\"")
(def ^:private index (atom -1))
(def ^:private tokens (atom []))

(defn has-more-tokens [] (let [i @index
                               cnt (count @tokens)]
                           (< i (- cnt 1))))
(defn advance [] (swap! index inc))
(defn curr-token [] (get @tokens @index))
(defn token-type [] (:type (curr-token)))
(defn token-val [] (:value (curr-token)))

(defmacro ^:private remove-tok!
  "adds match returned by `re-find` to `tokens` and recurs to the next loop with the token removed from `line`"
  [line re ttype]
  `(let [match# (str (first (re-find ~re ~line)))]
     (swap! tokens conj (->Token match# ~ttype))
     (recur (str/trim (.substring ~line (.length match#))))))

(defn- tokenize-line [full-line]
  (loop [line full-line]
    (when (not (str/blank? line))
      (cond
        ; comments
        (= (str/index-of line "//") 0) (recur "")
        (= (str/index-of line "/*") 0) (let [end-comm (str/index-of line "*/")]
                                         (if (nil? end-comm)
                                           (throw (Exception. "Could not find end of /* style comment. These must be single if there is code anywhere on the same line as the start or end of the comment."))
                                           (recur (str/trim (.substring line (+ 2 end-comm))))))
        ; symbols
        (not (nil?
              (some #{(.substring line 0 1)}
                    symbols))) (do
                                 (swap! tokens conj (->Token (.substring line 0 1) :symbol))
                                 (recur (str/trim (.substring line 1))))
        ; keywords
        (not (nil? (re-find kw-re line))) (remove-tok! line kw-re :keyword)
        ; identifiers
        (not (nil? (re-find ident-re line))) (remove-tok! line ident-re :identifier)
        ; integer constant
        (not (nil? (re-find int-re line))) (remove-tok! line int-re :integerConstant)
        ; str const - don't include the "'s in token, but move past them in string, hence the (+ 2 match)
        (not (nil? (re-find str-re line))) (let [match (second (re-find str-re line))]
                                             (swap! tokens conj (->Token match :stringConstant))
                                             (recur (str/trim (.substring line (+ 2 (.length match))))))

        :else (throw (Exception. (str "unrecognized tokens: " line)))))))

(defn- tokenize
  ([lines] (tokenize lines false))
  ([lines handling-multi]
   (if (empty? lines)
     nil
     (let [line (str/trim (first lines))
           line-comm? (= (str/index-of line "//") 0)
           block-comm? (= (str/index-of line "/*") 0)]
      ;; exclude comment only and blank lines  
       (when (and
              (not line-comm?)
              (not block-comm?)
              (not (str/blank? line))
              (not handling-multi))
         (tokenize-line line))

       (if (and (not handling-multi) block-comm? (nil? (str/index-of line "*/")))
         ;; new multi-line block comment
         (recur (rest lines) true)
         (if (and handling-multi (nil? (str/index-of line "*/")))
           (recur (rest lines) true) ; still looking for end comment tag "*/"
           (recur (rest lines) false)))))))


(defn init-tokenizer [path]
  (let [rdr (io/reader path)
        lines (line-seq rdr)]
    (reset! tokens [])
    (reset! index -1)
    (tokenize lines)
    (.close rdr)))



(comment
  (System/getProperty "user.dir")
  (.charAt "hey" 0)
  (init-tokenizer arr-test)
  (re-find str-re "\"heyyyyyy?\"")
  (macroexpand '(remove-tok! line (re-find kw-re line) first :keyword))
  (do (reset! tokens []) (reset! index 0))
  (tokenize-line "function void main() {")
  @tokens
  (map #((println (str (:value %) " " (:type %)))) @tokens)
  (loop [toks @tokens]
    (when (seq toks)
      (println (str (:value (first toks)) " " (:type (first toks))))
      (recur (rest toks)))))

"loaded tokenizer"