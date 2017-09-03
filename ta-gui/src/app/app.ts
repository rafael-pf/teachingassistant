import { Component } from '@angular/core';
import { NgModule } from '@angular/core';

import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';

@Component({
  selector: 'app-root',
  standalone: false,
  templateUrl: './app.html',
  styleUrls: ['./app.css']
})
export class AppComponent {
   constructor(private alunoService: AlunoService) {}

   aluno: Aluno = {nome: "", cpf: "", email: "", loginGithub: ""};
   alunos: Aluno[] = [];
   cpfduplicado: boolean = false;

   gravar(a: Aluno): void {
     if (this.alunoService.gravar(a)) {
       this.alunos.push(a);
       this.aluno = {nome: "", cpf: "", email: "", loginGithub: ""};
     } else {
       this.cpfduplicado = true;
     }
  }
  onMove(): void {
      this.cpfduplicado = false;
  }
}
