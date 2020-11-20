parent("Ruth","Peter").
parent("Ruth","Alex").
parent("Ruth","Ruby").
parent("Mark","Peter").
parent("Mark","Alex").
parent("Mark","Ruby").

parent("Peter","Abelt").
parent("Peter","Casey").
parent("Peter","Edward").
parent("Peter","Andy").
parent("Foxie","Abelt").
parent("Foxie","Casey").
parent("Sandra","Edward").
parent("Sandra","Andy").

parent("Alex","Wendy").
parent("Alex","Rebecca").
parent("Paul","Wendy").
parent("Paul","Rebecca").

parent("Ruby","Alice").
parent("Ruby","Marco").
parent("Ruby","Mary").
parent("Ruby","Michael").
parent("Ruby","Harry").
parent("Adam","Alice").
parent("Adam","Marco").
parent("Gary","Mary").
parent("Gary","Michael").
parent("Gary","Harry").

parent("Rose","Maria").
parent("Rose","Tuna").
parent("Vannadi","Zura").
parent("Vannadi","Eric").
parent("Abelt","Maria").
parent("Abelt","Tuna").
parent("Abelt","Zura").
parent("Abelt","Eric").

parent("Steve","Alan").
parent("Casey","Alan").

parent("Rebecca","Scott").
parent("Rebecca","Suzie").
parent("Phillip","Scott").
parent("Phillip","Suzie").

parent("Luther","Tom").
parent("Luther","Ben").
parent("Alice","Tom").
parent("Alice","Ben").

parent("Michael","Norman").
parent("Tulips","Norman").

parent("Harry","John").
parent("Harley","John").


male("Mark").
male("Peter").
male("Paul").
male("Adam").
male("Gary").
male("Abelt").
male("Steve").
male("Edward").
male("Andy").
male("Phillip").
male("Luther").
male("Marco").
male("Michael").
male("Harry").
male("Eric").
male("Alan").
male("Scott").
male("Tom").
male("Ben").
male("Norman").
male("John").

female("Ruth").
female("Foxie").
female("Sandra").
female("Alex").
female("Ruby").
female("Rose").
female("Vannadi").
female("Casey").
female("Wendy").
female("Rebecca").
female("Alice").
female("Mary").
female("Tulips").
female("Duffie").
female("Harley").
female("Maria").
female("Tuna").
female("Zura").
female("Suzie").

married("Ruth","Mark").
married("Peter","Sandra").
married("Alex","Paul").
married("Adam","Ruby").
married("Rose","Abelt").
married("Steve","Casey").
married("Rebecca","Phillip").
married("Luther","Alice").
married("Michael","Tulips").
married("Duffie","Harry").

divorced("Foxie","Peter").
divorced("Ruby","Gary").
divorced("Abelt","Vannadi").
divorced("Harry","Harley").

%other relationships
wife(Person,Husband):-
    married(Person,Husband);married(Husband,Person),
    male(Husband),
    female(Person).
husband(Person,Wife):-
    married(Person,Wife);married(Wife,Person),
    female(Wife),
    male(Person).

father(Person,Child):-
    parent(Person,Child),
    male(Person).
mother(Person,Child):-
    parent(Person,Child),
    female(Person).
child(Person,Parent):-
    parent(Parent,Person).
son(Person,Parent):-
    child(Person,Parent),
    male(Person).
daughter(Person,Parent):-
    child(Person,Parent),
    female(Person).

grandparent(Person,GC):-
    parent(Person,C),
    parent(C,GC).
grandfather(Person,GC):-
    grandparent(Person,GC),
    male(Person).
grandmother(Person,GC):-
    grandparent(Person,GC),
    female(Person).
grandchild(Person,GP):-
    grandparent(GP,Person).
grandson(Person,GP):-
    grandchild(Person,GP),
    male(Person).
granddaughter(Person,GP):-
    grandchild(Person,GP),
    female(Person).

sibling(Person,Other):-
    child(Person,P),
    child(Other,P),
    Person \= Other.
brother(Person,Other):-
    sibling(Person,Other),
    male(Person).
sister(Person,Other):-
    sibling(Person,Other),
    female(Person).
aunt(Person,Other):-
    sister(Person,P),
    parent(P,Other).
uncle(Person,Other):-
    brother(Person,P),
    parent(P,Other).
niece(Person,Other):-
    sibling(Other,Pr),
    parent(Pr,Person),
    not(child(Person,Other)),
    female(Person).
nephew(Person,Other):-
    sibling(Other,Pr),
    parent(Pr,Person),
    not(child(Person,Other)),
    male(Person).

great_grandparent(Person,GGC):-
    grandparent(Person,GC),
    parent(GC,GGC).
great_grandfather(Person,GGC):-
    great_grandparent(Person,GGC),
    male(Person).
great_grandmother(Person,GGC):-
    great_grandparent(Person,GGC),
    female(Person).
great_grandchild(Person,GGP):-
    great_grandparent(GGP,Person).
great_grandson(Person,GGP):-
    great_grandchild(Person,GGP),
    male(Person).
great_granddaughter(Person,GGP):-
    great_grandchild(Person,GGP),
    female(Person).
