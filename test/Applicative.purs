module Test.Applicative where


import Prelude

import Course.Applicative (apply, lift2, partialLeft, partialRight, pure, sequence)
import Course.Array (CArray(..), Maybe(..))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert (assert)


applicativeTest :: TestSuite
applicativeTest = do
    suite "applicative test" do
       test "array applicative" do
          assert "lift to array" $ pure 1 == Cons 1 Nil
          assert "apply on array" $ apply (Cons (\x -> x+1) Nil) (Cons 1 Nil) == Cons 2 Nil
       test "maybe applicative" do
          assert "lift to maybe" $ pure 1 == Just 1
          assert "apply on maybe" $ apply (Just (\x -> x+1)) (Just 2) ==Just 3
          assert "apply on nothing" $ apply (Just (\x -> x + 1)) Nothing == Nothing
       test "lift2 applicative" do
          assert "lift2 on maybe" $ lift2 (\a b -> a + b) (Just 1) Nothing == Just 1 
          assert "lift2 on array" $ lift2 (\a b -> a + b) (Cons 1 Nil) (Cons 2 Nil) == Cons 3 Nil
       test "partialRight applicative" do
          assert "partialRight on Array" $ partialRight (Cons 1 Nil) (Cons 2 Nil) == Cons 2 Nil
          assert "paritalRight on Maybe" $ partialRight (Just 1) (Just 2) == Just 2
       test "partialLeft applicative" do
          assert "partialLeft on Array" $ partialLeft (Cons 1 Nil) (Cons 2 Nil)  == Cons 1 Nil
          assert "partialLeft on Maybe" $ partialLeft (Just 2) Nothing == Just 2
       test "sequence" do
          assert "sequence with maybe" $ sequence (Cons (Just 1) (Cons Nothing Nil)) == Just (Cons 1 Nil)
          assert "sequence with fn" $ (sequence (Cons (\x -> x+1) Nil)) 5 == Cons 6 Nil
