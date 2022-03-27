(ns compiler-clojure.core
  (:require [compiler-clojure.tokenizer :refer [init-tokenizer
                                                advance
                                                has-more-tokens
                                                token-type
                                                token-val
                                                curr-token]]
            [clojure.string :as str]
            [clojure.java.io :as io]
            [clojure.walk :as walk])
  (:import [java.io File])
  (:gen-class))


(require [compiler-clojure.tokenizer :refer [init-tokenizer advance has-more-tokens token-type token-val curr-token]])

(defn get-paths [file]
  (if (.isFile file)
    (vec (.getCanonicalPath file))
    ; directory -- find all Jack files
    (let [files (vec (.list file))
          jack-files (vec (filter
                           #(= (.substring % (str/last-index-of % ".")) ".jack") files))]
      (println (str "jack files: " jack-files))
      (vec (map #(str (.getCanonicalPath file) "/" %) jack-files)))))

(defn- to-xml [s]
  (-> s
      (str/replace "&" "&amp;")
      (str/replace "\"" "&quot;")
      (str/replace "<" "&lt;")
      (str/replace ">" "&gt;")))

(defn- write-tok [wrtr s]
  (.write wrtr s)
  (.flush wrtr))

(defn- process-tokens [in-path]
  (let [out-path (str/replace in-path ".jack" "T.xml")
        wrtr (io/writer out-path)]
    (println (str "out-path: " out-path))
    (write-tok wrtr "<tokens>\n")
    ;; (spit out-path "<tokens>\n")
    (while (has-more-tokens)
      (advance)

      (let [tval (token-val)
            tt (name (token-type))]
        (write-tok wrtr (str "<" tt "> " (to-xml tval) " </" tt ">\n"))))
    (write-tok wrtr "</tokens>\n")
    (.close wrtr)))


(defn -main
  "Main entry point to Jack Compiler"
  [& args]
  (when (not= (count args) 1)
    (throw (IllegalArgumentException. "Please give 1 argument containing the full path to the .jack file or directory containing .jack")))

  (let [path (first args)
        file (File. path)
        all-paths (get-paths file)]
    (println (str "all-paths: " all-paths))
    (loop [paths all-paths
           path (first paths)]
      (when (not (nil? path))
        (println (str "tokenizing " path))
        (init-tokenizer path)
        (process-tokens path)
        (recur (rest paths) (second paths))))))


(defmacro hi [] `(println "hi"))
(walk/macroexpand-all '(defmacro hi [] `(println "hi")))
