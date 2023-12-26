grammar1:: Int -> String -> String
grammar1 count string | count == 0 = string
                      | True       = (grammar1 (count - 1) (string++['A']))