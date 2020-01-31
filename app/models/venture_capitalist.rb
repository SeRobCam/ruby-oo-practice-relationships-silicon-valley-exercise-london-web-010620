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

    def self.tres_commas_club 
       self.all.select { |worth| worth.total_worth > 1000000000}
    end
    
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end 
    
    #This is a method to simplify the tipying later:
    def funding_rounds
        FundingRound.all.select { |fr| fr.venture_capitalist == self }
    end 
    
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
