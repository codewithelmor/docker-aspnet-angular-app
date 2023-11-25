import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { findIndex } from 'lodash';
import Swal from 'sweetalert2';
import { RelationshipCreateModel } from '../../models/relationship.create.model';
import { RelationshipModel } from '../../models/relationship.model';
import { RelationshipUpdateModel } from '../../models/relationship.update.model';
import { RelationshipService } from '../../services/relationship.service';

@Component({
  selector: 'app-relationship-table',
  templateUrl: './relationship-table.component.html',
  styleUrls: ['./relationship-table.component.css']
})
export class RelationshipTableComponent implements OnInit {

  public relationships: RelationshipModel[] = [];

  public createFormGroup = new FormGroup({
    name: new FormControl('', [Validators.required, Validators.maxLength(20)]),
  });

  public updateFormGroup = new FormGroup({
    id: new FormControl(0, [Validators.required]),
    name: new FormControl('', [Validators.required, Validators.maxLength(20)]),
    isActive: new FormControl(false, [Validators.required]),
  });

  constructor(
    private relationshipService: RelationshipService
  ) {
  }

  ngOnInit(): void {
    this.relationshipService
      .list()
      .subscribe(response => {
        this.relationships = response;
      }, (error) => {
        console.error(error);
      });
  }

  onCreateFormSaveChanges() {
    const model: RelationshipCreateModel = JSON.parse(JSON.stringify(this.createFormGroup.value));

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

        this.relationshipService
          .create(model)
          .subscribe(response => {
            
            this.relationships.push(response);

            swalWithBootstrapButtons.fire(
              'Created!',
              'Your record has been created.',
              'success'
            )

            const closeButton = document.getElementById('closeRelationshipCreateForm');
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
      name: new FormControl('', [Validators.required, Validators.maxLength(20)]),
    });
  }

  onOpenUpdateForm(relationship: RelationshipModel) {
    this.updateFormGroup = new FormGroup({
      id: new FormControl(relationship.id, [Validators.required]),
      name: new FormControl(relationship.name, [Validators.required, Validators.maxLength(20)]),
      isActive: new FormControl(relationship.isActive, [Validators.required]),
    });
  }

  onUpdateFormSaveChanges() {
    const relationship: RelationshipModel = JSON.parse(JSON.stringify(this.updateFormGroup.value));
    console.log(relationship);
    const model: RelationshipUpdateModel = {...relationship};

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

        this.relationshipService
          .update(relationship.id, model)
          .subscribe(response => {
            
            const index = findIndex(this.relationships, x => x.id === relationship.id);
            console.log(index);
            this.relationships[index] = relationship;

            swalWithBootstrapButtons.fire(
              'Created!',
              'Your record has been updated.',
              'success'
            )

            const closeButton = document.getElementById('closeRelationshipUpdateForm');
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
      name: new FormControl('', [Validators.required, Validators.maxLength(20)]),
      isActive: new FormControl(false, [Validators.required]),
    });
  }

  onDelete(relationship: RelationshipModel) {
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

        this.relationshipService
          .delete(relationship.id)
          .subscribe(response => {
            
            const index = findIndex(this.relationships, x => x.id === relationship.id);
            this.relationships.splice(index, 1);

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
