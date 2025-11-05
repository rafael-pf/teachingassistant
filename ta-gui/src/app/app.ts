import { Component } from '@angular/core';
import { NgModule } from '@angular/core';

@Component({
  selector: 'app-root',
  standalone: false,
  templateUrl: './app.html',
  styleUrls: ['./app.css']
})
export class AppComponent {
   aluno: Aluno = {nome: "", cpf: "", email: "", loginGithub: ""};
}

export class Aluno {
  nome: string;
  cpf: string;
  email: string;
  loginGithub: string;
}
