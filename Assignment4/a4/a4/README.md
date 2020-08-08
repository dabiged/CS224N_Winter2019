# NMT Assignment 4
Note: Heavily inspired by the https://github.com/pcyin/pytorch_nmt repository

# Analyzing NMT Systems
**Source Sentence:** Aquı́ otro de mis favoritos, “La noche estrellada”.

**Reference Translation:** So another one of my favorites, “The Starry Night”.

**NMT Translation:** Here’s another favorite of my favorites, “The Starry Night”.


*Identify the Error:*				 Here the word Favorite has been repeated.

*Provide a reason why the error occurred:*	 I think when translating 'aqui otro' is has gone looking for a noun and found 'favorite' then it has translated 'de mis favoritos' literally.

*Describe a way to alter the NMT to fix the error:* Alter the beam search algorithm to penalise repeated words.

**Source Sentence:** Ustedes saben que lo que yo hago es escribir para los niños, y, de hecho, probablemente soy el autor para niños, ms ledo en los EEUU.

**Reference Translation:** You know, what I do is write for children, and I’m probably America’s most widely read children’s author, in fact.

**NMT Translation:** You know what I do is write for children, and in fact, I’m probably the author for children, more reading in the U.S.


*Identify the Error:*				 The section of this sentence `author for children, more reading in the U.S.` makes no sense.

*Provide a reason why the error occurred:*	 `ms ledo en` translates to `more read in` whereas `ms ledo en los EEUU` translates into `most read in the USA.` This appears to be an error in mapping a non-tense based verb `ledo` into a tense based verb `read/reading`.

*Describe a way to alter the NMT to fix the error:* ???


**Source Sentence:** Un amigo me hizo eso – Richard Bolingbroke.

**Reference Translation:** A friend of mine did that – Richard Bolingbroke.

**NMT Translation:** A friend of mine did that – Richard <unk >


*Identify the Error:*				 The word Bolingbroke is not a token in either language embedding dictionary.

*Provide a reason why the error occurred:*	 This is an uncommon word.

*Describe a way to alter the NMT to fix the error:* Either copy unknown words as they exist or design a leter-by-letter translator for unknown words.


**Source Sentence:** Solo tienes que dar vuelta a la manzana para verlo como una

epifanı́a.

**Reference Translation:** You’ve just got to go around the block to see it as an epiphany.

**NMT Translation:** You just have to go back to the apple to see it as a epiphany.


*Identify the Error:*				 Here the noun `manzana` has been incorrectly translated.

*Provide a reason why the error occurred:*	 Manzana seems to have two meanings in spanish, apple translates to manzana, but `city block` translates to `manzana de la ciudad`. It seems the presence of the word `vuelta` is instrumental in ensuring the translation is the correct one.

*Describe a way to alter the NMT to fix the error:* Perhaps adjust the attention mechanism to ensure that vuelta is included in the translation of manzana.



**Source Sentence**: Ella salvó mi vida al permitirme entrar al baño de la sala de

profesores.

**Reference Translation**: She saved my life by letting me go to the bathroom in the teachers’

lounge.

**NMT Translation**: She saved my life by letting me go to the bathroom in the women’s room.





*Identify the Error:*				 Here profesores is incorrectly tranlated to women rather than teachers.

*Provide a reason why the error occurred:*	 Training data contains bias around gender roles.

*Describe a way to alter the NMT to fix the error:* Augement training data.



**Source Sentence**: Eso es más de 100,000 hectáreas.

**Reference Translation**: That’s more than 250 thousand acres.

**NMT Translation**: That’s over 100,000 acres.



*Identify the Error:*				 Incorrect translation of hectareas.

*Provide a reason why the error occurred:*	 It seems that acres and hectares both translate to hectareas. The human translator knows this and has corrected it.

*Describe a way to alter the NMT to fix the error:* Include more training data with area based tokens.





# Examples from this NMT

Below are 10 examples randomly chosen from the test set. I have made random choices to prevent any accusations of selection bias.



Original Spanish:        Las tres palabras son: Se acuerda Ud.?

Reference Translation:   The three words are:  Do you remember?

This Work's Translation: The three words are <unk>



Original Spanish:        Si te rodeas de las personas adecuadas, no solo te entendern, tambin te apreciarn.

Reference Translation:   If you are surrounding yourself with the right people,  they will not only get it,  they will appreciate it.

This Work's Translation: If you get away from the right people, not just <unk> you will be <unk>



Original Spanish:        Muchas gracias.


Reference Translation:   Thank you very much.

This Work's Translation: Thank you very much.



Original Spanish:        Lo que vemos es un pequeo pedacito de metal, con forma de trampoln y que sobresale apoyado en una plataforma.

Reference Translation:   So what we're looking at is a little chunk of metal,  and it's shaped like a diving board, and it's sticking out over a ledge.

This Work's Translation: What we see is a little bit of metal little little bit of metal shape, and which is <unk> on a platform.



Original Spanish:        Y juntos llegamos a darnos cuenta de que todos estamos juntos en esto, que esta ilusin de que somos diferentes, estos conceptos de los pases, de las fronteras, de la religin, no funciona.

Reference Translation:   And you come together to realize that we're all in this together,  that this delusion of difference --  this idea of countries, of borders, of religion -- doesn't work.

This Work's Translation: And together we get to realize that we're all together in this, that this illusion that we are different, these concepts of the countries, of the borders, it doesn't work.


Original Spanish:        Soy un fracaso como mujer y como feminista.

Reference Translation:   I am failing as a woman,  I am failing as a feminist.

This Work's Translation: I'm a failure as a woman, and as a feminist.



Original Spanish:        Le dije que s.

Reference Translation:   And I said, "Yes."

This Work's Translation: I said yes.



Original Spanish:        Para m, Afganistn es un pas de esperanza y posibilidades ilimitadas, y cada da las nias de SOLA me lo recuerdan.

Reference Translation:   To me, Afghanistan is a country of hope and boundless possibilities,  and every single day  the girls of SOLA remind me of that.

This Work's Translation: For me, Afghanistan is a country of hope and possibilities -- and every day girls in <unk> I would get it.



Original Spanish:        Estas mujeres se reunan simplemente para hablar.

Reference Translation:   And these women would get together and just talk.

This Work's Translation: These women were getting together just to speak.



Original Spanish:        Tenemos que ayudar a nuestros adolescentes a desarrollar estrategias para superar la presin de las imgenes perfectas y construir su autoestima.

Reference Translation:   We have to help our teenagers develop  strategies to overcome image-related pressures  and build their self-esteem.

This Work's Translation: We have to help our teens develop strategies to overcome the pressure of perfect images and build their self-esteem.



