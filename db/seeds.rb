Band.destroy_all
Musician.destroy_all
BandMember.destroy_all

['Funky Cats', 'Glib Banjoes', 'The Jobsworths', 'Hampanderers'].each do |name|
  Band.create(name: name)
end

musician_names = %w[James Janice Joy Vashti Catabra Jiang Meow]

musician_names.each { |name| Musician.create(name: name, age: rand(70) + 18) }

instruments = %w[guitar banjo drums keyboard synth piano saxophone violin]

Band.all.each_with_index do |band, idx|
  members = 4 + idx

  Musician.all.take(members).each do |m| 
    BandMember.create(band_id: band.id, musician_id: m.id, instrument: instruments.sample)
  end
end
