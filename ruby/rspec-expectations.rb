# expect + to = should
value.should eq 0
expect(value).to eq 0

# inversion with 'not'
value.should_not eq 0
expect(value).not_to eq 0

# 'be' for strict comparison
expect(value).to be something

# numeric comparison options
expect(100).to be > 90
expect(100).to == 100
expect(100).to equal something
expect(100).to be_between(1, 1000)
expect(100).to be_within(10).of something

# a bit more meta
expect(value).to satisfy { |arg| ... }
expect(value).to match /regex/
expect(value).to respond_to :predicate?
expect(value).to be_an_instance_of SomeClass

# exceptions — notice curly braces
expect { post.save! }.to raise_error
