{-# LANGUAGE ForeignFunctionInterface #-}

module Main where

-- import Haskell type representing the C int type
import Foreign.C.Types ( CInt(..) )

-- Import the sayHello & factorial function
-- from the function.o object file
foreign import ccall "sayHello" sayHello :: IO CInt
foreign import ccall "factorial" factorial :: CInt -> IO CInt

-- use factorial function from c Foreign Function
doFactorial :: Int -> IO Int
doFactorial n = do
  result <- factorial (fromIntegral n)
  return (fromIntegral result)

-- Define the main function that calls the sayHello function
main :: IO ()
main = do
  -- Bind doFactorial function to dofac
  dofac <- doFactorial 5
  putStrLn $  "factorial 5 is " ++ show dofac
  -- Bind the return value of the sayHello function to the _ variable
  _ <- sayHello
  -- Return an empty tuple () to indicate that 
  -- the main function has a return type of IO ()
  return ()
