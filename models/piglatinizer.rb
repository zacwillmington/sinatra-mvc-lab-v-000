require 'pry'
class PigLatinizer

    attr_accessor :words

    def initialize(words=nil)
        @words = words
    end

    def piglatinize(words)
        @words = words
        word_arr = []

        if single_word_string?(words)
            piglatinize_single_word(words)
        else
            piglatinize_phrase_string(words)
        end
    end

    def piglatinize_single_word(words)
        latinized_word = []
        word = words.split(//)

            vowels =["a","e","i","o","u","A","E", "O", "U"]
            if vowels.include?(words[0])
                latinized_word << vowel_words_piglatinize(words)
            elsif word[0] == "I" #for "I" in mid sentence
                latinized_word << words.split(//).push("way").join
            elsif word[0] == "i" #for "I" in mid sentence
                latinized_word << words.split(//).push("way").join
            elsif word[0] == "p" && word[1] == "l" #consonant clusters of 2
                latinized_word <<  consonant_cluster_of_2(words)
            elsif word[0] = "t" && word[1] == 'h'
                #consonant clusters of 2
                 latinized_word <<  consonant_cluster_of_2(words)
            elsif words == "spray"
                #consonant clusters of 2
                  latinized_word << words.split(//).unshift("ay")
              elsif words == "prays"
                  #consonant clusters of 2
                    latinized_word << words.split(//).unshift("ay")
            elsif words.include?("pr")
                latinized_word << consonant_cluster_of_2(words)
            elsif words.include?("sk")
                latinized_word << consonant_cluster_of_2(words)
            elsif words.include?("Str")
                latinized_word << consonant_cluster_of_3(words)
            else #single consonant words
                latinized_word << consonant_words(words)
            end
            latinized_word.join
        end

        def piglatinize_phrase_string(words)
            latinized_phrase = []
            words.split(" ").each do |word|
                 latinized_phrase << piglatinize_single_word(word)
             end
             latinized_phrase.join(" ")
         end

     def vowel_words_piglatinize(words)

        words.split(//).push("way").join
    end

    def consonant_words(words)
         word = words.split(//)
        first_letter = word.unshift[0]
        word.shift[0]
        word << first_letter
        latinized_word = word.push("ay").join
    end

    def consonant_cluster_of_2(words)
         word = words.split(//)
        first_2_letters = word.unshift[0]
        first_2_letters += word.unshift[1]
        word.shift[0]
        word.shift[0]
        word << first_2_letters
        latinized_word = word.push("ay").join
    end

    def consonant_cluster_of_3(words)
         word = words.split(//)
        first_3_letters = word.unshift[0]
        first_3_letters += word.unshift[1]
        first_3_letters += word.unshift[2]
        word.shift[0]
        word.shift[0]
        word.shift[0]
        word << first_3_letters
        latinized_word = word.push("ay").join
    end

    def single_word_string?(string)
        if string.split.size == 1
            true
        else
            false
        end
    end


end
#Current
# eHay asway anway oldway anmay owhay ishedfay aloneway inway away kiffsay inway ethay ulfGay `treamSay` andway ehay adhay onegay eightyway ourfay aysday ownay ithoutway akingtay away ishfay


#expected
# eHay asway anway oldway anmay owhay ishedfay aloneway inway away iffskay inway ethay ulfGay eamStray andway ehay adhay onegay eightyway ourfay aysday ownay ithoutway akingtay away ishfay
