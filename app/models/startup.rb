require 'pry'

class Startup

    attr_reader :founder
    attr_accessor :name, :domain, :funding_round

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def self.all 
        @@all
    end

    def pivot(new_name, new_domain)
        name = new_name
        domain = new_domain
    end

    def self.find_by_founder(founder)
        self.all.find do |str| 
            str.founder == founder
        end 
    end

    def self.domains
        self.all.map do |str| 
            str.domain
        end
    end

    def sign_contract(venture_capitalist,type,investment)
        FundingRound.new(self,venture_capitalist,type,investment)
    end

    # Using a method to simplify tipying later:
    #def funding_rounds 
    #     FundingRound.all.select { |fr| fr.startup == self }
    # end

    def num_funding_rounds 
        FundingRound.all.select { |fr| fr.startup == self }.count
        #Or: funding_rounds.sum(&:investment)
    end

    def total_funds 
        fr = []
        FundingRound.all.select do |fund|
            if fund.startup == self 
                fr << fund.investment.to_i 
            end
        end
        fr.sum
    end
    
    def investors 
        vent_cap = []
        FundingRound.all.select do |fund|
            if fund.startup == self 
                vent_cap << fund.venture_capitalist
            end
        end
        vent_cap.uniq
    end

    # Or:
    # def investors 
    #     funding_rounds.map{|fr| fr.venture_capitalist}.uniq
    # end
    
    def big_investors
        big = []
        investors.select do |worth|
            if worth.total_worth > 1000000000
                big << worth.name
            end 
        end
        big
    end

    # Or:
    # def big_investors 
    #     investors.select {|vc| VentureCapitalist.tres_commas_club.include?(vc)}
    # end

end
