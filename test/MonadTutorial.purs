module Test.MonadTutorial where


import Course.Applicative (pure)
import Course.Functor (map)
import Course.Monad (bind)
import Course.MonadTutorial (liftToJff)
import Prelude (discard, eq, show, ($), (+), (==))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert (assert)


monadTutorialTest :: TestSuite
monadTutorialTest = do
    suite "monad tutor starts" do
       test "functor, pure and bind for monad Jff" do
          assert "must be Jff 4" $ eq (map (\val -> val+2) (liftToJff 2)) (liftToJff 4) == true
          assert "must be Jff 4" $ eq (bind (liftToJff 2) (\val -> liftToJff $ val+2)) (liftToJff 4) == true
          assert "must be true" $ eq (liftToJff 2) (pure 2) == true
        
       test "shows, lift, eq Jff" do
          assert "should be Jff 4" $ show (liftToJff 4 ) == "4" 
          assert "should be false" $ eq (liftToJff 4) (liftToJff 5) == false
