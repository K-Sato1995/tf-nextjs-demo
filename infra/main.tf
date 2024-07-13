terraform {
  required_providers {
    vercel = {
      source = "vercel/vercel"
      version = "~> 0.3"
    }
  }
}

resource "vercel_project" "tf-nextjs-demo" {
  name      = "tf-nextjs-demo"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "K-Sato1995/tf-nextjs-demo"
  }
}
