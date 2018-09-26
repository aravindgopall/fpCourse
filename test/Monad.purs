module Test.Monad where


import Prelude

import Course.Array (CArray(..), Maybe(..))
import Course.Monad (bind, join, kleisli)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert (assert)


monadTest :: TestSuite
monadTest = do
    suite "monad test starts" do
       test "bind and monad test for carray" do
          assert " bind for carray" $ bind (Cons 2 Nil)(\a -> Cons a Nil) == Cons 2 Nil
          assert "bind for carray Nil" $ bind Nil (\a -> (Cons (a+1) Nil)) == Nil
       test "bind and monad test for maybe" do
          assert "bind for maybe" $ bind (Just 2)(\a -> Just a) == Just 2
          assert "bind for maybe nil" $ bind Nothing (\a -> (Just (a+1)))== Nothing
       test "bind and monad test for function" do
          assert "bind and monad for function" $ (bind (\a -> a+10) (\a -> (\b -> a* b))) 7 == 119
       test "test join " do
          assert "join with CArray" $ join (Cons (Cons 1 Nil) (Cons (Cons 2 Nil) Nil)) == (Cons 1 (Cons 2 Nil))
          assert "join with Maybe" $ join (Just (Just 2)) == Just 2
       test "test kliesli" do
          assert "kliesli with CArray" $ kleisli (\a -> Cons a Nil) (\b -> Cons b Nil) 2 == (Cons 2 Nil)
          assert "kliesli with Maybe" $ kleisli (\a -> Just (a*3) ) (\b -> Just (b+1)) 3 == Just 12 
