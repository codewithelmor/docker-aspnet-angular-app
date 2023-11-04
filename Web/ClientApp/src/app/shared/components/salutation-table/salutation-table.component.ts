import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { findIndex } from 'lodash';
import Swal from 'sweetalert2';
import { SalutationCreateModel } from '../../models/salutation.create.model';
import { SalutationModel } from '../../models/salutation.model';
import { SalutationUpdateModel } from '../../models/salutation.update.model';
import { SalutationService } from '../../services/salutation.service';

@Component({
  selector: 'app-salutation-table',
  templateUrl: './salutation-table.component.html',
  styleUrls: ['./salutation-table.component.css']
})
export class SalutationTableComponent implements OnInit {

  public salutations: SalutationModel[] = [];

  public createFormGroup = new FormGroup({
    title: new FormControl('', [Validators.required, Validators.maxLength(5)]),
  });

  public updateFormGroup = new FormGroup({
    id: new FormControl(0, [Validators.required]),
    title: new FormControl('', [Validators.required, Validators.maxLength(5)]),
    isActive: new FormControl(false, [Validators.required]),
  });

  constructor(
    private salutationService: SalutationService
  ) {
  }

  ngOnInit(): void {
    this.salutationService
      .list()
      .subscribe(response => {
        this.salutations = response;
      }, (error) => {
        console.error(error);
      });
  }

  onCreateFormSaveChanges() {
    const model: SalutationCreateModel = JSON.parse(JSON.stringify(this.createFormGroup.value));

    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: 'btn btn-success',
        cancelButton: 'btn btn-danger'
      },
      buttonsStyling: false
    })
    
    swalWithBootstrapButtons.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, create it!',
      cancelButtonText: 'No, cancel!',
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {

        this.salutationService
          .create(model)
          .subscribe(response => {
            
            this.salutations.push(response);

            swalWithBootstrapButtons.fire(
              'Created!',
              'Your record has been created.',
              'success'
            )

            const closeButton = document.getElementById('closeSalutationCreateForm');
            closeButton?.click();            
            
          }, (error) => {
            swalWithBootstrapButtons.fire(
              'Failed',
              'Failure creating record',
              'error'
            )
          });
      } else if (
        /* Read more about handling dismissals below */
        result.dismiss === Swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire(
          'Cancelled',
          'Your record was not created!',
          'error'
        )
      }
    })
  }

  onCloseCreateForm() {
    this.createFormGroup = new FormGroup({
      title: new FormControl('', [Validators.required, Validators.maxLength(5)]),
    });
  }

  onOpenUpdateForm(salutation: SalutationModel) {
    this.updateFormGroup = new FormGroup({
      id: new FormControl(salutation.id, [Validators.required]),
      title: new FormControl(salutation.title, [Validators.required, Validators.maxLength(5)]),
      isActive: new FormControl(salutation.isActive, [Validators.required]),
    });
  }

  onUpdateFormSaveChanges() {
    const salutation: SalutationModel = JSON.parse(JSON.stringify(this.updateFormGroup.value));
    console.log(salutation);
    const model: SalutationUpdateModel = {...salutation};

    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: 'btn btn-success',
        cancelButton: 'btn btn-danger'
      },
      buttonsStyling: false
    })
    
    swalWithBootstrapButtons.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, update it!',
      cancelButtonText: 'No, cancel!',
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {

        this.salutationService
          .update(salutation.id, model)
          .subscribe(response => {
            
            const index = findIndex(this.salutations, x => x.id === salutation.id);
            console.log(index);
            this.salutations[index] = salutation;

            swalWithBootstrapButtons.fire(
              'Created!',
              'Your record has been updated.',
              'success'
            )

            const closeButton = document.getElementById('closeSalutationUpdateForm');
            closeButton?.click();
            
          }, (error) => {
            swalWithBootstrapButtons.fire(
              'Failed',
              'Failure updating record',
              'error'
            )
          });
      } else if (
        /* Read more about handling dismissals below */
        result.dismiss === Swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire(
          'Cancelled',
          'Your record was not updated!',
          'error'
        )
      }
    })
  }  

  onCloseUpdateForm() {
    this.updateFormGroup = new FormGroup({
      id: new FormControl(0, [Validators.required]),
      title: new FormControl('', [Validators.required, Validators.maxLength(5)]),
      isActive: new FormControl(false, [Validators.required]),
    });
  }

  onDelete(salutation: SalutationModel) {
    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: 'btn btn-success',
        cancelButton: 'btn btn-danger'
      },
      buttonsStyling: false
    })
    
    swalWithBootstrapButtons.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, cancel!',
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {

        this.salutationService
          .delete(salutation.id)
          .subscribe(response => {
            
            const index = findIndex(this.salutations, x => x.id === salutation.id);
            this.salutations.splice(index, 1);

            swalWithBootstrapButtons.fire(
              'Deleted!',
              'Your record has been deleted.',
              'success'
            )
            
          }, (error) => {
            swalWithBootstrapButtons.fire(
              'Failed',
              'Failure deleting record',
              'error'
            )
          });
      } else if (
        /* Read more about handling dismissals below */
        result.dismiss === Swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire(
          'Cancelled',
          'Your record is safe :)',
          'error'
        )
      }
    })
  }

}
