require "oystercard"

describe Oystercard do
    it "expects no error when creating Oystercard instance" do
        expect {Oystercard.new}.not_to raise_error
    end

    it "has a default balance of 0 unless stated otherwise" do
        expect(subject.balance).to eq 0
    end

    
end