# This help function is used to create character column vector of length
# number. The value of the character is char.
#
# returns a data frame.

makeCharVector <- function(char="", number=1)
{
    character_data_frame = data.frame()

    for (i in 1:number)
    {
        character_data_frame[i,1] <- char
    }

    return(character_data_frame)
}
