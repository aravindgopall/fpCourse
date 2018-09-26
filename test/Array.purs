module Test.CArray where

import Course.Array

import Prelude (discard, negate, ($), (+), (<), (<<<), (==), (>))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert (assert)

testCArray :: TestSuite
testCArray = do
    suite "Array Test" do
       test "getHeadOrNil" do 
            assert "must be 1" $ getHeadOr 1 Nil == 1
            assert "must be 2" $ getHeadOr 0 (Cons 2 Nil) == 2
       {-- test "sumAll test" do --}
       {--      assert "must be 0" $ sumAll Nil == 0 --}
       {--      assert "must be 6" $ sumAll (Cons 1 (Cons 2 (Cons 3 Nil))) == 6 --}
       {-- test "length test" do --}
       {--      assert "must be 0" $ lengthFp Nil == 0 --}
       {--      assert "must be 2" $ lengthFp (Cons 1 (Cons 2  Nil)) == 2 --}
       {-- test "map test" do --}
       {--      assert "must be Nil" $ map (\x -> x+1) Nil == Nil --}
       {--      assert "must be 1 added" $ map (\x -> x+1) (Cons 1 (Cons 2 Nil)) == (Cons 2 (Cons 3 Nil)) --}
       {-- test "filter test" do --}
       {--      assert "must be Nil" $ filter (\x -> x>2) Nil == Nil --}
       {--      assert "must be 1" $ (lengthFp <<< filter (\x -> x < 1)) (Cons 0 (Cons 1 (Cons 3 Nil))) == 1 --}
       {-- test "flatten test" do --}
       {--      assert "must be [1,2]" $ flatten (Cons (Cons 1 Nil) (Cons (Cons 2 Nil) Nil)) == (Cons 1 (Cons 2 Nil)) --}
       {-- test "find Test" do --}
       {--      assert "must be Nothing" $ find 1 Nil == Nothing --} 
       {--      assert "must be Maybe 2" $ find 2 (Cons 1 (Cons 3 (Cons 2 Nil))) == Just 2 --}
       {-- test "reverse test" do --}
       {--      assert "must be equal" $ reverse (Cons 1 Nil) == (Cons 1 Nil) --}
       {--      assert "must be reverse" $ reverse (Cons 1 (Cons 2 Nil)) == (Cons 2 (Cons 1 Nil)) --}
       {-- test "seq test" do --}
       {--      assert "array to maybe" $ seqMaybe (Cons (Just 1) (Cons Nothing Nil)) == Just (Cons 1 Nil) --}
       {-- test "zip test" do --}
       {--      assert "add two arrays" $ zipWith (\x y-> x+y) (Cons 1 (Cons 4 Nil)) (Cons (-1) (Cons 4 Nil)) == (Cons 0 (Cons 8 Nil)) --}

