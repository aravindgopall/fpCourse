module Test.Functor where

import Course.Array (CArray(..), Maybe(..))
import Course.Functor (map, void, voidRight)
import Prelude (discard, unit, ($), (*), (+), (==))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert (assert)

functorTest :: TestSuite
functorTest = do
    suite "functor testing" do
        test "map for Array" do
            assert "map basic array" $ map (\val -> val+1) (Cons 1 (Cons 3 Nil)) == (Cons 2 (Cons 4 Nil))
        test "map for maybe" do
            assert "map maybe " $ map (\val -> val + 2) (Just 2) == Just 4
            assert "map Nothing" $ map (\val -> val +2 ) Nothing == Nothing
        test "map for function" do
            assert "map function" $ (map (\val -> val +1) (\val -> val *2)) 8 == 17 
        test "map for void Right" do
           assert "for void Right" $ voidRight 2 (Cons "me" Nil) == (Cons 2 Nil)
        test "map for void" do
           assert "for void" $ void (Cons 1 (Cons 2 Nil)) == (Cons unit (Cons unit Nil))
 
