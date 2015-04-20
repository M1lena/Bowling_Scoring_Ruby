require 'bowling_score'

describe BowlingScore do
  subject { BowlingScore.new }

  context 'bowling game without strikes for every frame' do
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
      subject.first_frame(0, 1)
      subject.second_frame(10, 0)
      subject.third_frame(2, 1)
      expect(subject.score).to eq 16
    end

    # it 'calculates score for two rolls of fourth frame' do
    #   subject.first_frame(3, 7)
    #   subject.second_frame(2, 1)
    #   subject.third_frame(2, 1)
    #   subject.fourth_frame(5, 4)
    #   expect(subject.score).to eq 27
    # end

    # it 'calculates spare form first roll into score of fourth frame' do
    #   subject.first_frame(3, 7)
    #   subject.second_frame(2, 1)
    #   subject.third_frame(10, 0)
    #   subject.fourth_frame(5, 2)
    #   expect(subject.score).to eq 37
    # end
  end

  context 'bowling perfect game' do
    xit 'has an initial score of zero' do
      expect(subject.score).to eq 0
    end
  end
end
