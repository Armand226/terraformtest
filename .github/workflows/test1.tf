name: Terraform Deploy MongoDB Atlas

on:
  workflow_dispatch:

jobs:
  terraform:
    name: Deploy MongoDB Atlas
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v2
        with:
          terraform_version: 1.5.0

      - name: Terraform Init
        run: terraform init

      - name: Terraform Plan
        run: terraform plan
        env:
          MONGODB_ATLAS_PUBLIC_KEY: ${{ secrets.MONGODB_ATLAS_PUBLIC_KEY }}
          MONGODB_ATLAS_PRIVATE_KEY: ${{ secrets.MONGODB_ATLAS_PRIVATE_KEY }}
          MONGODB_ATLAS_ORG_ID: ${{ secrets.MONGODB_ATLAS_ORG_ID }}
          MONGODB_ATLAS_DB_PASSWORD: ${{ secrets.MONGODB_ATLAS_DB_PASSWORD }}

      - name: Terraform Apply
        run: terraform apply -auto-approve
        env:
          MONGODB_ATLAS_PUBLIC_KEY: ${{ secrets.MONGODB_ATLAS_PUBLIC_KEY }}
          MONGODB_ATLAS_PRIVATE_KEY: ${{ secrets.MONGODB_ATLAS_PRIVATE_KEY }}
          MONGODB_ATLAS_ORG_ID: ${{ secrets.MONGODB_ATLAS_ORG_ID }}
          MONGODB_ATLAS_DB_PASSWORD: ${{ secrets.MONGODB_ATLAS_DB_PASSWORD }}
