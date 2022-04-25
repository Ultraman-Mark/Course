<template>
  <div class="card mb-4 shadow-sm course">
    <img class="img-fluid" v-bind:src="course.image">
    <div class="card-body">
      <h4 class="">{{course.name}}</h4>
      <p class="card-text">{{course.summary}}</p>
      <div class="d-flex justify-content-between align-items-center">
        <div class="btn-group">
          <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
        </div>
        <small class="text-muted">
          <span class="badge badge-info"><i class="fa fa-yen" aria-hidden="true"></i>&nbsp;{{course.price}}</span>&nbsp;
          <span class="badge badge-info"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;123</span>&nbsp;
          <span class="badge badge-info">{{ $filters.optionKV(COURSE_LEVEL,course.level) }}</span>
        </small>
      </div>
    </div>
  </div>
</template>

<script>
  import course from "../../../admin/src/views/admin/course";

  export default {
    name: 'the-course',
    props:['course'],
    data: function () {
      return {
        COURSE_LEVEL: course.level,
      }
    },
  }
</script>

<style>
  .course h4 {
    font-size: 1.25rem;
    margin: 15px 0;
  }

  .course .text-muted .badge {
    font-size: 1rem;
  }
</style>