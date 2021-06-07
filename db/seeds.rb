books_list = {
    "Instructions For Dancing" => { 
    :popular => "June" 
    }, 
    "Skye Falling" => {  
    :popular => "June" 
    },
    "HALF SICK of SHADOWS" => {  
    :popular => "June" 
    },
    "The Maidens" => {  
    :popular => "June" 
    },
    "Malibu Rising" => {  
    :popular => "June" 
    },
    "Things We Lost To The Water" => {
    :popular => "May"
    },
    "How Lucky" => {
    :popular => "May"
    },
    "The Last Thing He Told Me" => {
    :popular => "May"
    },
    "Imposter Syndrome" => {
    :popular => "May"
    },
    "Ariadne" => {
    :popular => "May"
    }
}

books_list.each do |name, book_hash|
    b = Book.new
    b.name = name
    book_hash.each do |attribute, value|
        b[attribute] = value
    end
    b.save
end

author_list = {
    "Nicola Yoon" => {
    },
    "Mia Mckenzie" => {
    },
    "Laura Sebastian" => {
    },
    "Alex Michaelides" => {
    },
    "Taylor Jenkins Reid" => {
    },
    "Eric Nguyen" => {
    },
    "Will Leitch" => {
    },
    "Laura Dave" => {
    },
    "Kathy Wang" => {
    },
    "Jennifer Saint" => {
    }
}

author_list.each do |name, author_hash|
    b = Author.new
    b.name = name
    b.save
end

genre_list = {
    "Young Adult" => {
    },
    "Contemporary Fiction" {
    },
    "Fantasy" => {
    },
    "Thriller" => {
    },
    "Historical Fiction" => {
    }
}