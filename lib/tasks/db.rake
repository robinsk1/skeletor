#encoding: utf-8

namespace :db do
  desc "TODO"
  task :festivals => :environment do

    [Festival].each(&:delete_all)

    Festival.create(:name => "Sónar", :location =>"Barcelona, Spain", :description=>"Sónar calls itself a “International Festival Advanced Music and Multimedia Art”. The festival has been around since 1994, focusing primarily on electronic music. The events are divided up into two halves: Daytime at the Fira Montjuic exhibition center, which showcases lesser-known talent, and nighttime at Fira Gran Via de L’Hospital, which showcases the big-ticket names.",
                    :image_url => '/festivals/2013/sonar.png' )
        puts "Created Sonar2013"
    Festival.create(:name => "Coachella", :location =>"Indio, California", :description=>"To give you an idea of what Coachella means to people: Lindsay Lohan allegedly scheduled a stint in rehab around the dates of this year’s fest to ensure that she’d be able to attend. It’s where Rihanna is pictured rolling a blunt from atop some guy’s shoulders. It’s where Frank Ocean meets his love interest in “Novacane”. It’s where reunions by bands like the Pixies, Iggy and the Stooges, At the Drive-In, Refused, Pulp, and Rage Against the Machine have launched. Since it began in 1999, Coachella has become such a big deal that fake lineup announcements are bigger news than most things in the music industry.",
                    :image_url => '/festivals/2013/coachella.png')
        puts "Created Coachella"
    #Festival.create(:name => "Donaufestival", :location =>"Krems, Austria", :description=>"Donaufestival-- in the beautiful, historic riverside city of Krems in northeast Austria-- is one of the most progressive arts festivals in Europe. (It runs with the full support of Kultur Niederösterreich, Austria's Department for Education, Art, and Culture, in case you needed further evidence that living as an artist in Europe means basically living the dream.)",
    #                :image_url => '/festivals/2013/Donaufestival.png')
    #    puts "Created Donaufestival"
    #Festival.create(:name => "Austin Psych Fest", :location =>"Austin, Texas", :description=>"Founded in 2008, the scope of Austin Psych Fest now reaches further than its name suggests. This year, the three-day event’s lineup includes Os Mutantes (from Brazil), Holydrug Couple (from Chile), Tinariwen (from Mali), Boris and Acid Mothers Temple (from Japan), plus one of only a handful of reunion dates by the Moving Sidewalks, the 60s Texas band that featured ZZ Top’s Billy Gibbons.",
    #                :image_url => '/festivals/2013/austin.png')
    #    puts "Created Austin Psych Fest"
    #Festival.create(:name => "All Tomorrow's Parties", :location =>"London, England ", :description=>"Since 2000, the promoters behind All Tomorrow’s Parties and their sister festival I’ll Be Your Mirror have let headlining bands pick not only the supporting acts on their brilliant bills but also the films at the festival, the books at the reading group, and sometimes much more. (Kelley Deal taught knitting classes when the Breeders ran the show in 2009; in 2011, Caribou actually curated a smell.) Held at a holiday park in Camber Sands, an hour south of London, ATP festivals feature bands and fans living and hanging out in the same complex for the duration of the fest. This year’s ATP is split between two weekends: the first curated by TV on the Radio, the second by Deerhunter. At the latter, Deerhunter will perform their albums Cryptograms, Microcastle & Halcyon Digest in full.",
    #                :image_url => '/festivals/2013/atp.png')
    #    puts "Created All Tomorrow's Parties"
    #Festival.create(:name => "Downtown Music Festival", :location =>"New York, New York", :description=>"This year, NYC’s Downtown Records-- home to the likes of Major Lazer, Santigold, Spank Rock, and more-- is expanding its recurring Downtown Music Festival. Along with a two-day blowout at venues across Lower Manhattan, the festival broadens its reach to various cities in North America this year, including Philadelphia, Toronto, Boston, Los Angeles, Denver, and Las Vegas, each with a unique lineup.",
    #                :image_url => '/festivals/2013/downtown.png')
    #    puts "Created Downtown Music Festival"
    #Festival.create(:name => "Plisskën", :location =>"Athens, Greece", :description=>"Looking at the recent news coming out of Greece, you’d assume it’s a difficult location to hold a music festival. The country is currently beset by extreme economic problems, and ongoing fallout from mass violent rioting in the capital. Still, Plisskën-- a small but growing festival based around the Building 56 venue-- has been soldiering through since 2010 in the hope of making a small difference. A spokesman for the festival tells us that they understand that the “intense political, social and financial turmoil of the last five years in Greece” mean that for most people-- who have lost their jobs, houses, and friends-- spending money on seeing a group of underground acts won’t exactly be a priority. But in spite of having zero support from public institutions, they keep the entry price low to attract locals-- 30€-- and have begun to notice an uptake in foreign visitors, who then spend money on accommodation and in local businesses.",
    #                :image_url => '/festivals/2013/plissken.png')
    #    puts "Created Plisskën"
    Festival.create(:name => "Primavera Sound", :location =>"Barcelona", :description=>"Barcelona’s Primavera Sound is kind of like the European Coachella: A massive, well-respected, hugely anticipated festival that occurs early in the season, setting the tone for what comes after. Established in 2001, it takes place in Parc del Fòrum, a set of concrete plazas and fields right on the shores of the Mediterranean in downtown Barcelona. In addition to an exceptional, wide-ranging lineup of international artists, Primavera also hosts a plethora of homegrown artists.",
                    :image_url => '/festivals/2013/primavera.png')
        puts "Created Primavera Sound"
    #Festival.create(:name => "Sasquatch!", :location =>"Quincy, Washington", :description=>"For just over a decade, Sasquatch! has been the Northwest’s answer to America’s other huge regional destination festivals-- the Coachella, Bonnaroo, or Lollapalooza of the Pacific Northwest. The fest takes place on the picturesque cliffs of the Columbia River Gorge, at the Gorge Amphitheatre in Quincy, Washington. Many festivalgoers camp out.",
    #                    :image_url => '/festivals/2013/sasquatch.png')
    #    puts "Created Sasquatch!"
    #Festival.create(:name => "Vivid Sydney", :location =>"Sydney Australia", :description=>"Vivid is not your typical music festival. For two-and-a-half weeks, Sydney is transformed by exhibitions of light, sound, and ideas. Throughout the city are immersive light installations and projections to accompany a series of performances that take place at the Sydney Opera House from local and international acts.",
    #                        :image_url => '/festivals/2013/vivid.png')
    #    puts "Created Vivid Sydney!"
    #Festival.create(:name => "Mutek", :location =>"Montreal, Quebec", :description=>"This one’s for the electronic music obsessives who want something more subtle, tame, and brainy than the blowouts found at post-dubstep EDM events like Electric Daisy Carnival or Ultra. Now in its 14th year, the Montreal festival, which takes place at venues ranging in size all over the city, has grown from an intimate crowd of a couple thousand to a sizable event that draws over 25,000. Mutek has expanded to include events in Germany, Argentina, Chile, Mexico, and more, and it also runs a record label.",
    #                            :image_url => '/festivals/2013/mutek.png')
    #        puts "Created Mutek"
    #Festival.create(:name => "Chaos in Tejas", :location =>"Austin, Texas", :description=>"Chaos in Tejas takes place at several venues across Austin. You know, like SXSW-- except with thousands fewer people and an extremely specific stable of artists. This year features the festival’s usual set of heavy rock’n’roll (Baroness, Iceage, the Men), a few quieter acts (Grouper, Waxahatchee, Jessica Pratt), metal bands with names like Speedwolf, local punks (Mind Spiders, the Marked Men), and as usual, a few underground bands that haven’t played together in a while. Case in point: Portland punks (and Dead Moon precursors) the Rats. This year they’ll share the stage with Merchandise and Screaming Females-- two bands whose members weren’t yet born when the Rats broke up in the early 80s.",
    #                               :image_url => '/festivals/2013/tejas.png')
    #           puts "Created tejas"
    #Festival.create(:name => "Roots Picnic", :location =>"Philidelphia, Pennsylvannia", :description=>"This year marks the sixth annual Roots Picnic, the intimate hometown weekend arranged by Philadelphia’s favorite musical poster-children. The festival, which takes place in the city, on the water at Penn’s Landing’s Festival Pier, has grown in reputation without losing any of its hand-picked eclecticism-- it’s a small event where Grimes, Macklemore, and Gary Clark, Jr. can all sit comfortably near the top of the bill.",
    #                               :image_url => '/festivals/2013/roots.png')
    #           puts "Created Roots"
    #Festival.create(:name => "Hot 97 Summer Jam", :location =>"East Rutherford, New Jersey", :description=>"20 years old. The legendary Summer Jam, held at a stadium in New Jersey, is often a place where history is made. During his 2001 set alone, Jay-Z infamously dissed Prodigy by projecting photos of the Mobb Deep rapper dressed up as a ballet dancer as a child, ignited his long-simmering feud with Nas, and brought out Michael Jackson. In 2002, Nas wanted to hang an effigy of Jay-Z as part of his headlining set; Hot 97 refused, so Nas didn’t show up. Destiny’s Child got booed in 2001, 50 Cent got booed in 2004. Last year, headliner Nicki Minaj withdrew at the last minute after Hot 97 host Peter Rosenberg derided her and her more pop-leaning fans. 2007 found Kanye West and Swizz Beatz in an adrenaline-pumping (but good-natured) beat battle. The list goes on.",
    #                               :image_url => '/festivals/2013/jam.png')
    #           puts "Created Summer Jam"
    #Festival.create(:name => "Governors Ball", :location =>"Randalls Island, New York", :description=>"After many, many unsuccessful attempts, it seems like New York City finally has an enormous outdoor summer indie (mostly) rock festival that’s going to be sticking around awhile. (Anybody remember Across the Narrows? Field Day? All Points West?) Governors Ball got started in 2011 as a one-day affair with a handful of DJs and rappers. In 2012, it expanded to two days and included artists like Beck, Fiona Apple, and Modest Mouse. This year the festival clearly popped a whole fistful of steroids-- they’ve not only added an extra day but nabbed a headlining set from Guns N’ Roses. Axl and Kanye West top the stacked lineup, and if somehow you manage to have extra time between all the sets you’ll want to catch, you can keep yourself busy with lawn games and ping pong tables, which will be set up across Randall’s Island. They’re also hosting a silent disco, and of course, they’ll have a photo booth set up. And the food? It looks amazing.",
    #                               :image_url => '/festivals/2013/governor.png')
    #           puts "Created governor"
    #Festival.create(:name => "Bonnaroo", :location =>"Manchester, Tennessee", :description=>"At some point between 2002 and 2013, Bonnaroo became enormous. Though it started out as a modest, jam band- and bluegrass-centric festival in a field in the middle of Tennessee, it soon began to draw marquee names: Radiohead, Jay-Z, and an unannounced D’Angelo, for starters. This year they bagged Paul McCartney and Weird Al. And if that’s not enough to convince you to camp out in absurdly hot weather, their annual  “Superjam” will feature Jim James and John Oates (sans Hall, sadly), plus there’s a comedy tent curated by IFC, a cinema tent, a brewery tent,  a kids’ stage, a silent disco, and a giant water slide.",
    #                               :image_url => '/festivals/2013/bonnaroo.png')
    #           puts "Created Bonnaroo"
    #Festival.create(:name => "Northside", :location =>"Brooklyn, New York", :description=>"In its fifth year, Northside Festival is a week-long marathon of music and film in in Greenpoint and Williamsburg organized by The L Magazine. It adopts a model similar to CMJ or SXSW-- panels, semi-useful badges, lots of venues-- but smaller in scale, less corporate, more affordable, and generally more fan-friendly. It’s also a good a reason as any to travel to Brooklyn for a weekend, especially considering most events are within walking distance from the new Williamsburg Waterfront park and plenty of great record shops. Northside also includes two free concerts at McCarren Park on Saturday and Sunday and free music programming in the street on Bedford Ave. (Pitchfork is curating two events at this year’s Northside.)",
    #                               :image_url => '/festivals/2013/northside.png')
    #           puts "Created Northside"
    #Festival.create(:name => "BET experience", :location =>"Los Angeles, California", :description=>"In addition to its sprawling network of broadcast programming and its growing awards show, Black Entertainment Television has launched its own festival. The inaugural BET Experience will take place at the Staples Center and surrounding venues as a lead-up to the BET Awards on July 1. It’s both huge and manageable at the same time, showcasing a relatively small group of big-name acts from Beyonce and Kendrick Lamar to New Edition and the Jacksons. (Beyonce will kick off the U.S. leg of her Mrs. Carter Show tour there.)",
    #                               :image_url => '/festivals/2013/bet.png')
    #           puts "Created BET"
    Festival.create(:name => "Roskilde", :location =>"Roskilde, Denmark", :description=>"If you’re interested in a huge outdoor European mega-festival, but the idea of 100,000-something people crammed onto a campground is unappealing, consider Roskilde. Launched in the early 1970s, it’s among the the biggest in Europe-- but it’s as friendly and organized as a festival of a much smaller size. While the campsites themselves can be rowdy and dirty, the concert grounds and surrounding areas feel calm, clean and safe. The crowd is primarily made up of a mix of Scandinavians and travellers from surrounding European countries, many of whom arrive early to camp out and enjoy pre-festival festivities.",
                                       :image_url => '/festivals/2013/roskilde.png')
               puts "Created roskilde"
    Festival.create(:name => "Melt", :location =>"Ferropolis, Germany", :description=>"As far as festival sites go, Melt!’s is pretty imposing. Since 1999, the German festival has taken place in Ferropolis (“the iron city”), Gräfenhainichen, a vast, open-space museum showcasing the imposing industrial equipment that functioned when the site was-- up until 1991-- a working coal mine. But Melt! offsets the site’s steely feel by draping the bucket wheel excavators and whatnot in disco balls, and dotting the campsite-- by a lake, where you can swim freely in the intense July heat-- with foosball tables and trucks billowing out ambient music. If fahren auf der Autobahn isn’t your preferred method of travel, you can book a compartment on the “Melt! MiXery Beds on Wheels Hotel Train” from either Cologne or Munich to the festival. It departs on Thursday, features a compartment containing DJs and a bar, and serves as your hotel during the festival itself. Otherwise, there’s bog-standard tents, or fancy “PodPads”, a sort of luxury shed with a front door that locks, rudimentary lighting and electricity points.",
                                   :image_url => '/festivals/2013/melt.png')
               puts "Created melt"
    #Festival.create(:name => "Fuji Rock", :location =>"Niigata, Japan", :description=>"Fuji Rock takes place in the mountains of Japan’s ridiculously beautiful Naeba Ski Resort, surrounded by woods and streams.The people behind Fuji Rock pride themselves on their use of clean energy and an overall “respect for nature.” They’ve also got an area specifically for drum circles, and there’s a stage called “Rookie a Go-Go” where amateurs can perform. There’s a campsite on location, though you can also get accommodations at a nearby resort or hotel.",
    #                                   :image_url => '/festivals/2013/fuji.png')
    #           puts "Created fuji"
    Festival.create(:name => "Bennicasim", :location =>"Bennicasim, Spain", :description=>"Back in 1991, Perry Farrell started Lollapalooza as a valedictory road show, serving as a farewell stint for his band Jane’s Addiction. Throughout the 90s, Lollapalooza served as a flashpoint for alternative culture, its very name becoming synonymous with the more “out-there” aspects of Generation X. Legions of alt-rock legends toured across America as part of its lineups.",
                                       :image_url => '/festivals/2013/bennicasim.png')
               puts "Created Bennicasim"
    Festival.create(:name => "T in the Park", :location =>"Balado, Kinross-shire", :description=>"Nine stages in the arena (plus four in the campsite!), across three days of festival entertainment, means a choice of up to 180 artists across a packed weekend. The biggest party in Scotland!",
                                           :image_url => '/festivals/2013/t.png')
               puts "Created T in the Park"
    Festival.create(:name => "Glastonbury", :location =>"Glastonbury, England", :description=>"Englands premier annual music festival",
                                           :image_url => '/festivals/2013/glastonbury.png')
               puts "Created Glastonbury"
    Festival.create(:name => "Bestival", :location =>"", :description=>"",
                                           :image_url => '/festivals/2013/bestival.png')
              puts "Created Bestival"
    #Festival.create(:name => "", :location =>"", :description=>"",
    #                                       :image_url => '/festivals/2013/.png')
    #          puts "Created "
  end





end
