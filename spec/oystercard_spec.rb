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

    context "spending and topping up our card" do
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

        it "deducts money from my card balance" do
            expect { card.deduct }.to change { card.balance }.by(-card.journey.fare)
        end
    end

    context "touching in, raises an error message if balance is less than 1" do
        let(:card) { described_class.new }
        let(:entry_station) { double :station } #so that it doesn't question what station is, because we don't have a station class at the moment
        let(:exit_station) { double :station }

        it "raises error if touching in with balance of less than 1" do
            expect {card.touch_in(entry_station)}.to raise_error "You're not passing with THAT balance"
        end
      end

    context "touches in" do
      let(:card) { described_class.new(10)}
      let(:entry_station) { double :station } #so that it doesn't question what station is, because we don't have a station class at the moment
      let(:exit_station) { double :station }
      let(:journey) {double :journey, start: true}

        it "saves the entry station when you touch in" do
          card.touch_in(entry_station)
          expect(card.entry_station).to eq (entry_station)
        end

        it "starts a journey (with an entry station)" do
          expect(card.touch_in(entry_station)).to eq (card.journey.start(entry_station))
        end



        it "set the entry station to nil when you touch out" do
          card.touch_out(exit_station)
          expect(card.entry_station).to eq nil
        end



        it 'deducts fare when touching out' do

          expect(card.touch_out(exit_station)).to eq(card.deduct)
          #change{ card.balance }.by(-1)
        end

        it "returns true if we are on a journey" do
          card.touch_in(entry_station)
          expect(card.in_journey?).to eq true
        end

        it "returns false if we are on a journey" do
          card.touch_out(exit_station)
          expect(card.in_journey?).to eq false
        end

        it "saves the touch out station when touching out" do
          card.touch_out(exit_station)
          expect(card.exit_station).to eq (exit_station)
        end

        it "perminantely saves the entry and exit stations" do
          card.touch_in(entry_station)
          card.touch_out(exit_station)
          expect(card.journey_log).to eq ([{entry: entry_station, exit: exit_station}])

      end
    end
end
