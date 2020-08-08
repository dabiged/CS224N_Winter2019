# NMT Assignment 4
Note: Heavily inspired by the https://github.com/pcyin/pytorch_nmt repository

# Analyzing NMT Systems

**Analysing Errors in translation and how to fix them:**

### Example 1
Original Spanish | Reference Translation | NMT Translation
--- | --- | ---
Aquı́ otro de mis favoritos, “La noche estrellada”. | So another one of my favorites, “The Starry Night”. | Here’s another favorite of my favorites, “The Starry Night”.


task | statement
--- | ---
*Identify the Error:*				| Here the word Favorite has been repeated.
*Provide a reason why the error occurred:*	 |I think when translating 'aqui otro' is has gone looking for a noun and found 'favorite' then it has translated 'de mis favoritos' literally.
*Describe a way to alter the NMT to fix the error:*| Alter the beam search algorithm to penalise repeated words.

### Example 2
Original Spanish | Reference Translation | NMT Translation
--- | --- | ---
Ustedes saben que lo que yo hago es escribir para los niños, y, de hecho, probablemente soy el autor para niños, ms ledo en los EEUU. |  You know, what I do is write for children, and I’m probably America’s most widely read children’s author, in fact. | You know what I do is write for children, and in fact, I’m probably the author for children, more reading in the U.S.

task | statement
--- | ---
*Identify the Error:*				 | The section of this sentence `author for children, more reading in the U.S.` makes no sense.
*Provide a reason why the error occurred:*	 | `ms ledo en` translates to `more read in` whereas `ms ledo en los EEUU` translates into `most read in the USA.` This appears to be an error in mapping a non-tense based verb `ledo` into a tense based verb `read/reading`.
*Describe a way to alter the NMT to fix the error:* | ???


### Example 3
Original Spanish | Reference Translation | NMT Translation
--- | --- | ---
Un amigo me hizo eso – Richard Bolingbroke. | A friend of mine did that – Richard Bolingbroke. | A friend of mine did that – Richard `<unk>`


task | statement
--- | ---
*Identify the Error:*				 |The word Bolingbroke is not a token in either language embedding dictionary.
*Provide a reason why the error occurred:*	 |This is an uncommon word.
*Describe a way to alter the NMT to fix the error:* |Either copy unknown words as they exist or design a leter-by-letter translator for unknown words.


### Example 4
Original Spanish | Reference Translation | NMT Translation
--- | --- | ---
Solo tienes que dar vuelta a la manzana para verlo como una epifanı́a.| You’ve just got to go around the block to see it as an epiphany. | You just have to go back to the apple to see it as a epiphany.


task | statement
--- | ---
*Identify the Error:*				 |Here the noun `manzana` has been incorrectly translated.
*Provide a reason why the error occurred:*	 |Manzana seems to have two meanings in spanish, apple translates to manzana, but `city block` translates to `manzana de la ciudad`. It seems the presence of the word `vuelta` is instrumental in ensuring the translation is the correct one.
*Describe a way to alter the NMT to fix the error:*| Perhaps adjust the attention mechanism to ensure that vuelta is included in the translation of manzana.



### Example 5
Original Spanish | Reference Translation | NMT Translation
--- | --- | ---
Ella salvó mi vida al permitirme entrar al baño de la sala de profesores. | She saved my life by letting me go to the bathroom in the teachers’ lounge.| She saved my life by letting me go to the bathroom in the women’s room.


task | statement
--- | ---
*Identify the Error:*				 |Here profesores is incorrectly tranlated to women rather than teachers.
*Provide a reason why the error occurred:*	 |Training data contains bias around gender roles.
*Describe a way to alter the NMT to fix the error:* |Augment training data.



### Example 6
Original Spanish | Reference Translation | NMT Translation
--- | --- | ---
Eso es más de 100,000 hectáreas.| That’s more than 250 thousand acres.| That’s over 100,000 acres.


task | statement
--- | ---
*Identify the Error:*				 |Incorrect translation of hectareas.
*Provide a reason why the error occurred:*	 |It seems that acres and hectares both translate to hectareas. The human translator knows this and has corrected it.
*Describe a way to alter the NMT to fix the error:* |Include more training data with area based tokens.



### Example 6
Original Spanish | Reference Translation | NMT Translation
--- | --- | ---
Le encontramos un lugar, la internamos, y la cuidamos y nos encargamos de su familia, porque era necesario, |We found her one, we got her there,  and we took care of her  and watched over her family,  because it was necessary. | We found one place, the <unk> and the <unk> and <unk> of his family, because it was necessary, because it was necessary, because it was necessary, because it was necessary, because it was necessary, because it was necessary, because it was necessary, because it was necessary, because it was necessary, because it was necessary, because it was necessary, because it was necessary, because it was necessary, because it was necessary,

task | statement
--- | ---
*Identify the Error:*				 | Obvious repetition
*Provide a reason why the error occurred:*	 | This sentence contains repeated use of the word `her`
*Describe a way to alter the NMT to fix the error:* | I have no idea ?!?!


Original Spanish | Reference Translation | NMT Translation
--- | --- | ---
Antes de que saliera "Rain Man" en 1988, solo un pequeo crculo, encarnado por expertos saba qu era el autismo, pero tras la inolvidable actuacin de Dustin Hoffman como Raymond Babbitt y el reconocimiento de "Rain Man" con 4 premios de la Academia, pediatras, psiclogos, maestros y padres de todo el mundo saban qu era el autismo. |Before "Rain Man" came out in 1988,  only a tiny, ingrown circle of experts knew what autism looked like,  but after Dustin Hoffman's unforgettable performance as Raymond Babbitt  earned "Rain Man" four Academy Awards,  pediatricians, psychologists,  teachers and parents all over the world knew what autism looked like. | Before I went out of <unk> <unk> in 1988, only a small circle, <unk> by experts knew what autism was but after the <unk> performance of <unk> <unk> as <unk> <unk> and <unk> <unk> with four awards from <unk> <unk> psychologists, teachers and parents all over the world knew what autism was. 

task | statement
--- | ---
*Identify the Error:*				 | Lots of `<unk>`s in the translation
*Provide a reason why the error occurred:*	 | A lot of out of vocabulary words.
*Describe a way to alter the NMT to fix the error:* | Expand vocabulary or modify NMT to copy unknown words over.

# Examples from this NMT

Below are 10 examples randomly chosen from the test set. I have made random choices to prevent any accusations of selection bias.


Original Spanish |Reference Translation | This Translation
--- | --- | ---
Las tres palabras son: Se acuerda Ud.? |The three words are:  Do you remember? | The three words are `<unk>`
Si te rodeas de las personas adecuadas, no solo te entendern, tambin te apreciarn.|If you are surrounding yourself with the right people,  they will not only get it,  they will appreciate it.|If you get away from the right people, not just `<unk>` you will be `<unk>`
Muchas gracias.|Thank you very much.|Thank you very much.
Lo que vemos es un pequeo pedacito de metal, con forma de trampoln y que sobresale apoyado en una plataforma.|So what we're looking at is a little chunk of metal,  and it's shaped like a diving board, and it's sticking out over a ledge.| What we see is a little bit of metal little little bit of metal shape, and which is `<unk>` on a platform.
Y juntos llegamos a darnos cuenta de que todos estamos juntos en esto, que esta ilusin de que somos diferentes, estos conceptos de los pases, de las fronteras, de la religin, no funciona.| And you come together to realize that we're all in this together,  that this delusion of difference --  this idea of countries, of borders, of religion -- doesn't work.|And together we get to realize that we're all together in this, that this illusion that we are different, these concepts of the countries, of the borders, it doesn't work.
Soy un fracaso como mujer y como feminista.|I am failing as a woman,  I am failing as a feminist.|I'm a failure as a woman, and as a feminist.
Le dije que s.|And I said, "Yes."|I said yes.
Para m, Afganistn es un pas de esperanza y posibilidades ilimitadas, y cada da las nias de SOLA me lo recuerdan.|To me, Afghanistan is a country of hope and boundless possibilities,  and every single day  the girls of SOLA remind me of that.|For me, Afghanistan is a country of hope and possibilities -- and every day girls in `<unk>` I would get it.
Estas mujeres se reunan simplemente para hablar.|And these women would get together and just talk.|These women were getting together just to speak.
Tenemos que ayudar a nuestros adolescentes a desarrollar estrategias para superar la presin de las imgenes perfectas y construir su autoestima.|We have to help our teenagers develop  strategies to overcome image-related pressures  and build their self-esteem.|We have to help our teens develop strategies to overcome the pressure of perfect images and build their self-esteem.



