require "oystercard"

describe Oystercard do
    context "creating the oyster card" do 

        it "expects no error when creating Oystercard instance" do
            expect {Oystercard.new}.not_to raise_error
        end
    
        it "has a default balance of 0 unless stated otherwise" do
            expect(subject.balance).to eq 0
        end
        
    end

    it "allows the user to top up money" do
        expect(subject.top_up(10)).to eq 10
    end

    it "after top up, balance is updated" do
        subject.top_up(15)
        expect(subject.balance).to eq 15
    end
    
    let(:card) { described_class.new(90) }
    it "raises error when balance is more than 90" do
        expect {card.top_up(1)}.to raise_error("You cannot top up over £90")
    end
end