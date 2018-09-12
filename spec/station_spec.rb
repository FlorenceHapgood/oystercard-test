require 'station'

 describe Station do
   let (:station) { described_class.new( 'Aldgate east', 1) }
   it 'knows its zone' do
     expect(station.zone).to eq 1
   end

   it 'knows its name' do
     expect(station.name).to eq 'Aldgate east'
   end
 end
