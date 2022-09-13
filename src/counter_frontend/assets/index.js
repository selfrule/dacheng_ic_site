import { counter_backend } from "../../declarations/counter_backend";
document.getElementById("submit").addEventListener("click", async () => {
  const num = document.getElementById("num").value.toString();

  // Interact with explore_hello actor, calling the greet method
  const greeting = await counter_backend.set(num);
  document.getElementById("result").innerText = await counter_backend.get();;
});
