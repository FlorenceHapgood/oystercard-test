require "journey"

describe Journey do
  let(:journey) {described_class.new}
  let(:start_station) {double :start_station} #accetta che Firenze è solo Firenze
  let(:end_station) {double :end_station}

  describe "#start" do
    it "starts a journey and saves the entry station" do
      journey.start(start_station)
      expect(journey.entry_station).to eq(start_station)
    end
  end

  describe "#finish" do
    it "finishes a journey and saves the exit_station" do
      journey.finish(end_station)
      expect(journey.exit_station).to eq(end_station)
    end
  end

  describe "#complete?" do
    it 'checks whether the journy is complete' do
      journey.start(start_station)
      journey.finish(end_station)
      expect(journey.complete?).to eq true
    end
  end

  describe '#fare' do
    it 'charges the minumum fare if the journey is completed' do
      #allow(journey).to receive(:complete?) {true}
      journey.start(start_station)
      journey.finish(end_station)
      expect(journey.fare).to eq 1
    end

    it 'charges a penalty fare if the journey is not completed' do
        journey.start(start_station)
        expect(journey.fare).to eq 6
    end
  end
end
