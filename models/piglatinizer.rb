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

            vowels =["a","e","i","o","u","A","E", "O", "U"]
            if vowels.include?(words[0])
                latinized_word << vowel_words_piglatinize(words)
            elsif words[0] == "I" #for "I" in mid sentence
                latinized_word << words.split(//).push("way").join
                binding.pry
            elsif words[0] == "p" && words[1] == "l" #consonant clusters of 2
                binding.pry
                latinized_word <<  consonant_cluster_of_2(words)
            elsif words[0] = "t" && words[1] == 'h'
                binding.pry
                #consonant clusters of 2
                 latinized_word <<  consonant_cluster_of_2(words)
            elsif words[0] == "s" && words[1] == "p" && words[2] == "r"#consonant clusters of 3
                latinized_word << words.split(//).shift("ay").join
            elsif words[0] == "s" && words[1] == "p"
                #consonant clusters of 2
                  latinized_word << words.split(//).shift("ay").join
            else #single consonant words
                binding.pry
                latinized_word << consonant_words(words)
            end
            latinized_word
        end

        def piglatinize_phrase_string(words)
            words.split(" ").each do |word|
                 latinized_phrase << piglatinize_single_word(word)
             end
             latinized_phrase
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
            string
        end
    end

end
