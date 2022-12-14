{-# LANGUAGE ForeignFunctionInterface #-}

module Main where

import Foreign.C.Types

-- Import the sayHello function from the function.o object file
foreign import ccall "sayHello" sayHello :: IO CInt

-- Define the main function that calls the sayHello function
main :: IO ()
main = do
  -- Bind the return value of the sayHello function to the _ variable
  _ <- sayHello
  -- Return an empty tuple () to indicate that the main function has a return type of IO ()
  return ()
