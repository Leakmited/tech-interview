console.log("Question 2");

interface Cat {
  name: string;
  age: number;
  breed: "European" | "Siamese" | "Persian";
  behavior: "friendly" | "afraid" | "aggressive";
}

const NINA = {
  name: "Nina",
  age: 4,
  breed: "European",
  behavior: "afraid",
} satisfies Cat;

const MIRENA = {
  name: "Mirena",
  age: 4,
  breed: "European",
  behavior: "friendly",
} satisfies Cat;

// How could i improve the typing of this function ?
// How could i improve the implementation of this function ?
function feedCat(cat: Cat) {
  console.log(`Feeding ${cat.name}...`);

  const hasEaten = (x: number) => Math.random() < x;

  switch (cat.behavior) {
    case "friendly":
      if (hasEaten(0.9)) {
        return { happy: true, cat };
      } else {
        return { happy: true, cat, reaction: "purr" };
      }
    case "afraid":
      if (hasEaten(0.5)) {
        return { happy: true, cat };
      } else {
        return {
          happy: false,
          cat,
          reaction: "hide under sofa",
        };
      }
    case "aggressive":
      return { happy: false, cat };
  }
}

function catReaction(reaction: string) {
  console.log(`The cat is ${reaction}`);
}

// I'm confused i want to check if the cat has eaten before trying to pet it.
const result = feedCat(NINA);

catReaction(result.reaction);
