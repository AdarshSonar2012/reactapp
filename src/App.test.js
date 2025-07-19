import "@testing-library/jest-dom";
import { render, screen, fireEvent } from "@testing-library/react";
import App from "./App";

test("adds two numbers and displays result", () => {
  render(<App />);

  fireEvent.change(screen.getByPlaceholderText("First number"), {
    target: { value: "10" },
  });
  fireEvent.change(screen.getByPlaceholderText("Second number"), {
    target: { value: "20" },
  });
  fireEvent.click(screen.getByText("Add"));

  expect(screen.getByText("Result: 30")).toBeInTheDocument();
});
