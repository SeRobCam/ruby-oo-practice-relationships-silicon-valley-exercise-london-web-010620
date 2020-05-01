class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all 
        @@all
    end

    def name 
        @name
    end

    def total_worth 
        @total_worth
    end

    #returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`)
    def self.tres_commas_club 
       self.all.select { |worth| worth.total_worth > 1000000000}
    end
    
    #given a **startup object**, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end 
    
    #returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select { |fr| fr.venture_capitalist == self }
    end 
    
    #Returns a **unique** list of all startups this venture capitalist has funded
    def portfolio 
        start = []
        FundingRound.all.select do |fund|
            if fund.venture_capitalist == self 
                start << fund.startup
            end
        end
        start
    end 

    # Or:
    # def portfolio 
    #     funding_rounds.map {|fr| fr.startup}.uniq
    # end
    
    #returns the largest funding round given by this venture capitalist
    def biggest_investment 
        big = []
        funding_rounds.select { |fr| big << fr.investment }
        big.max
        #binding.pry
    end 

    # Or:
    # def biggest_investment 
    #     funding_rounds.max_by{|fr| fr.investment}
    # end

    def invested(domain)
        frs = funding_rounds.select {|fr| fr.startup.domain == domain}
        frs.sum(:&investment)
    end

end
