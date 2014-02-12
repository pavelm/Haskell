{-
 -
 - Copyright (c) 2009-2010 Johnny Morrice
 -
 - Permission is hereby granted, free of charge, to any person
 - obtaining a copy of this software and associated documentation 
 - files (the "Software"), to deal in the Software without 
 - restriction, including without limitation the rights to use, copy, 
 - modify, merge, publish, distribute, sublicense, and/or sell copies 
 - of the Software, and to permit persons to whom the Software is 
 - furnished to do so, subject to the following conditions:
 -
 - The above copyright notice and this permission notice shall be 
 - included in all copies or substantial portions of the Software.
 -
 - THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
 - EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 - MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
 - NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 - BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 - ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 - CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 - SOFTWARE.
 -
-}

module Network.Shpider.TextUtils where

import Data.Char

import Network.URL

import Control.Arrow ( first )

-- | A case insensitive lookup for html attributes.
attrLookup :: String -> [ ( String , String ) ] -> Maybe String
attrLookup attr =
   lookup ( lowercase attr ) . map ( first lowercase )

-- | Drops whitespace from the beginning and end of strings.
trim :: String -> String
trim =
   dropWhile isSpace . reverse . dropWhile isSpace . reverse

-- | Turns a String lowercase.  <rant>In my humble opinion, and considering that a few different packages implement this meager code, this should be in the prelude.</rant>
lowercase :: String -> String 
lowercase =
   map toLower

-- | Encode spaces in a URL
escapeSpaces :: String -> String
escapeSpaces =
   encString True ( \ _ -> True )

