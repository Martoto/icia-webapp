import openai

# Set your OpenAI API key
openai.api_key = 'your-api-key-here'

def query_openai(prompt):
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=prompt,
        max_tokens=100
    )
    return response.choices[0].text.strip()

if __name__ == "__main__":
    prompt = "Write a short story about a robot learning to love."
    result = query_openai(prompt)
    print(result)