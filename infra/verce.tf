resource "vercel_project" "tf-nextjs-demo" {
  name      = "tf-nextjs-demo"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "K-Sato1995/tf-nextjs-demo"
  }
}

data "vercel_project_directory" "nextjs-blog" {
  path = "../nextjs-blog"
}

resource "vercel_deployment" "tf-nextjs-demo_deployment" {
  project_id  = vercel_project.tf-nextjs-demo.id
  files       = data.vercel_project_directory.nextjs-blog.files
  path_prefix = "../nextjs-blog"
  production  = true
}

resource "vercel_attack_challenge_mode" "tf-nextjs-demo_attack_challenge_mode" {
  project_id = vercel_project.tf-nextjs-demo.id
  enabled    = true
}

resource "vercel_project_domain" "tf-nextjs-demo_domain" {
  project_id = vercel_project.tf-nextjs-demo.id
  domain     = "shohey-time.com"
}
