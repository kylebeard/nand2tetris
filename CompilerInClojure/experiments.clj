(ns compiler-clojure.experiments
  (:require [compiler-clojure.tokenizer :refer [init-tokenizer advance has-more-tokens token-type token-val curr-token]] [clojure.string :as str] [clojure.java.io :as io])
  (:import [java.io File])
  (:gen-class))

(future (Thread/sleep 4000)
        (println "I'll print after 4 seconds"))
(println "I'll print immediately")

(let [result (future (println "this prints once")
                     (+ 1 1))]
  (println "deref: " @result)
  (println "@: " @result))
; => "this prints once"

(defn test-cond []
  (cond
    (= 1 2) (println "1 == 2")
    (= 1 1) (println "hey"))
  (println "got here"))
(test-cond)

(def p "/Users/kyle/Documents/Programming/nand2tetris/CompilerInClojure/test.txt")
(let [wrtr (io/writer p)]
  (.write wrtr "helllllllo")
  (.flush wrtr)
  (println (type wrtr)))