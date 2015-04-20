require 'bowling_score'

describe BowlingScore do
  subject { BowlingScore.new }

  context 'bowling game game without strikes' do
    it 'has an initial score of zero' do
      expect(subject.score).to eq 0
    end

    it 'calculates score for two rolls of first frame' do
      subject.first_frame(1, 1)
      expect(subject.score).to eq 2
    end

    it 'does not accept rolls greater than 10' do
      expect { subject.first_frame(11, 1) }.to raise_error
      ('there are only 10 pins to hit!')
    end

    it 'calculates score for two rolls of second frame' do
      subject.second_frame(3, 4)
      expect(subject.score).to eq 7
    end

    it 'calculates spare form first roll into score of second frame' do
      subject.first_frame(3, 7)
      subject.second_frame(2, 1)
      expect(subject.score).to eq 15
    end

    it 'calculates score for two rolls of third frame' do
      subject.first_frame(3, 7)
      subject.second_frame(2, 1)
      subject.third_frame(2, 1)
      expect(subject.score).to eq 18
    end

    it 'calculates spare form first roll into score of third frame' do
      subject.first_frame(3, 7)
      subject.second_frame(2, 1)
      subject.third_frame(2, 1)
      expect(subject.score).to eq 18
    end
  end
end
